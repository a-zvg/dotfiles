" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
syntax on

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set autowrite		" Automatically save before commands like :next and :make
set hidden		" Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)
" Поиск
"set showmatch		" Show matching brackets.
set noignorecase	" Do case sensitive matching
set incsearch		" Incremental search
set hlsearch            " Подсветка найденного текста
" Отступ
set softtabstop=4	" Отступ при нажатии tab
set shiftwidth=4	" Отступы при нажатии << и >>
set smarttab		" Отступ при нажатии tab в начале строки
set expandtab		" Замена символа табуляции на пробелы
set autoindent		" Автоотступ при добавлении новой строки
set smartindent		" Автоотступ в зависимости от контекста
" Оформление
"set textwidth=80		" Ширина текста в строке
set colorcolumn=121		" Подсветка столбца
set list			" Показывать непечатаемые символы
set listchars=tab:\ \ ,trail:.	" Табуляцию пробелами, а пробелы в конце строки точками
set number
"colorscheme desert
highlight LineNr ctermfg=grey
set cursorline
highlight CursorLine term=none cterm=none
"highlight CursorLine term=bold cterm=bold guibg=Grey40
"highlight CursorLineNr ctermfg=white

set dir=~/.vim		" директория для swap-файлов
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯЖ;ABCDEFGHIJKLMNOPQRSTUVWXYZ:,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

"let g:XkbSwitchEnabled = 1
"let g:XkbSwitchIMappings = ['ru']
"let g:XkbSwitchIMappingsTr = {
                "\ 'ru':
                "\ {'<': 'qwertyuiop[]asdfghjkl;''zxcvbnm,.`/'.
                "\       'QWERTYUIOP{}ASDFGHJKL:"ZXCVBNM<>?~@#$^&|',
                "\  '>': 'йцукенгшщзхъфывапролджэячсмитьбюё.'.
                "\       'ЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ,Ё"№;:?/'},
                "\ }

" Плагины
execute pathogen#infect()
set cscopetag
set csprg=gtags-cscope
cs add GTAGS

set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

nnoremap <silent> <Esc><Esc> :qa<CR>
"nnoremap <silent> <C-\><C-t> :tags<CR>
nnoremap <C-\><C-]> :GtagsCursor<CR>
" Поиск всех вхождений слова под курсором с подсветкой:
nnoremap <C-\><C-\> :let @/='\<<C-R><C-W>\>'<CR>:Gtags -g \<<C-R><C-W>\><CR>:set hlsearch<CR>
" на <C-[> висит unix Esc, так что есть задержка в секунду
nnoremap <silent> <C-[> :cs kill 0<CR> :cs add GTAGS<CR>
" Переопределение поиска, чтоб не прыгал на следующее совпадение
nnoremap * :let @/='\<<C-R><C-W>\>'<CR>wN:set hlsearch<CR>
nnoremap <C-\><C-[> :YcmCompleter GoTo<CR>
nnoremap <C-\><C-r> :YcmCompleter GoToReferences<CR>
nnoremap <C-\><C-t> :YcmCompleter GetType<CR>
nnoremap <C-\><C-f> :YcmCompleter FixIt<CR>
nnoremap <C-\><C-e> :YcmDiags<CR>
nnoremap <C-\><C-g> :Gtags -g 
nnoremap <C-\><C-s> :Gstatus<CR>
nnoremap <C-\><C-d> :Gdiff<CR>
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'
nnoremap <F2> :cp<CR>
nnoremap <F3> :cn<CR>
nnoremap <F4> :cl<CR>
nnoremap <F8> :NERDTreeToggle<CR>
nnoremap <F9> :TagbarToggle<CR>
nmap <F10> <Plug>window:quickfix:loop
command A call CurtineIncSw() " Переключение между cpp и h

"autocmd FileType tagbar setlocal nocursorline nocursorcolumn
"autocmd BufWritePost *.c,*.cpp,*.h silent! !gtags& " автоматический вызов gtags при сохранении буфера

" add yaml stuffs
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

autocmd BufEnter *.{cpp,h} :setlocal cindent cino=j1,(0,ws,Ws " правильные отступы для лямбд

if !has('gui_running')
  map <C-\><C-n> <A-n>
endif

let g:DoxygenToolkit_commentType = "C++"
let g:DoxygenToolkit_compactDoc = "yes"
let g:DoxygenToolkit_templateParamTag_post = " "
let g:DoxygenToolkit_paramTag_post = " "

set completeopt-=preview " Отключение preview-окна в YCM
"let g:UltiSnipsExpandTrigger="<c-j>" " UltiSnips по Ctrl+j
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

set foldmethod=syntax
set foldlevelstart=4
set foldcolumn=1

set laststatus=2 " для корректного отображения lightline
set noshowmode " отключить отображение режима, т.к. он теперь дублирует lightline

let &t_SI = "\e[5 q" " настройки курсора для разных режимов
let &t_EI = "\e[1 q"
let loaded_matchparen = 0 " не подсвечивать парные скобки
set ttimeout
set ttimeoutlen=1

"set ttyfast
"set lazyredraw
