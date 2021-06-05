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
set showcmd		" показывать размер выделяемых символов/строк
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
set colorcolumn=121		" подсветка столбца
set list			" показывать непечатаемые символы
set listchars=tab:\ \ ,trail:.	" табуляцию пробелами, а пробелы в конце строки точками
set number                      " показывать номера строк
highlight LineNr ctermfg=grey
"set cursorline
"highlight CursorLine term=none cterm=none
"highlight CursorLineNr ctermfg=white

set dir=~/.vim		" директория для swap-файлов
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯЖ;ABCDEFGHIJKLMNOPQRSTUVWXYZ:,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

" Настройки сворачивания блоков кода
set foldmethod=syntax
set foldlevelstart=4
set foldcolumn=1

" Настройки курсора для разных режимов
let &t_SI = "\e[5 q"
let &t_EI = "\e[1 q"
set ttimeout
set ttimeoutlen=1

" не подсвечивать парные скобки
let loaded_matchparen = 0

" Корректная работа с YAML
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
" правильные отступы для лямбд
autocmd BufEnter *.{cpp,h,hpp} :setlocal cindent cino=j1,(0,ws,Ws

" выход на Esc Esc
nnoremap <silent> <Esc><Esc> :qa<CR>
" переопределение поиска, чтоб не прыгал на следующее совпадение
nnoremap * :let @/='\<<C-R><C-W>\>'<CR>wN:set hlsearch<CR>
nnoremap + :let @/='<C-R>/\\|\<<C-R><C-W>\>'<CR>wN:set hlsearch<CR>
nnoremap _ :let @/=''<CR>:set nohlsearch<CR>
" выделить вставленный текст
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

" Навигация по quickfix
nnoremap [ :cp<CR>
nnoremap ] :cn<CR>

nnoremap <Leader><CR> :make 

" НАСТРОЙКИ НИЖЕ ТОЛЬКО ДЛЯ ПЛАГИНОВ
" подключение плагинов
execute pathogen#infect()

" Навигация по исходному коду с помощью gtags и ycm
nnoremap <C-\><C-]> :GtagsCursor<CR>
nnoremap <C-\><C-[> :YcmCompleter GoTo<CR>
nnoremap <C-\><C-r> :YcmCompleter GoToReferences<CR>
nnoremap <C-\><C-t> :YcmCompleter GetType<CR>
nnoremap <C-\><C-f> :YcmCompleter FixIt<CR>
nnoremap <C-\><C-e> :YcmDiags<CR>
nnoremap <C-\><C-g> :NERDTreeFind<CR>

" поиск текста (комбинация <C-_> = <C-/>)
nnoremap <C-_> :BLines<CR>
nnoremap <C-\><C-_> :Ack! -w<Space>
" поиск всех вхождений слова под курсором с подсветкой
nnoremap <C-\><C-\> :let @/='\<<C-R><C-W>\>'<CR>:Ack! -w <C-R><C-W><CR>:set hlsearch<CR>

nnoremap <C-B> :Buffers<CR>

" Работа с git
nnoremap <C-\><C-s> :Gstatus<CR>
nnoremap <C-\><C-d> :Gdiff<CR>

" поиск файлов
nnoremap <C-p> :FZF<CR>

nnoremap <F9> :NERDTreeToggle<CR>
nmap <F10> <Plug>window:quickfix:loop
nmap <F11> :TagbarToggle<CR>
" отключить подсветку синтаксиса YCM
nnoremap <F12> :let g:ycm_show_diagnostics_ui=0<CR>:YcmRestartServer<CR>

" переключение между cpp и h
command A call CurtineIncSw()

" Использовать плагину ack.vim утилиту ag
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
let g:ack_autoclose = 1

" Настройки шаблона doxygen-комментариев
let g:DoxygenToolkit_commentType = "C++"
let g:DoxygenToolkit_compactDoc = "yes"
let g:DoxygenToolkit_templateParamTag_post = " "
let g:DoxygenToolkit_paramTag_post = " "

" отключение preview-окна в YCM
set completeopt-=preview

"let g:UltiSnipsExpandTrigger="<c-j>" " UltiSnips по Ctrl+j
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" Настройки плагина lightline.vim
set laststatus=2  " для корректного отображения
set noshowmode    " отключить отображение режима, т.к. он теперь дублирует lightline
" отображение имени git-ветки с помощью fugitive
let g:lightline = {
  \   'active': {
  \     'left':[ [ 'mode', 'paste' ],
  \              [ 'gitbranch', 'readonly', 'filename', 'modified' ]
  \     ]
  \   },
  \   'component_function': {
  \     'gitbranch': 'fugitive#head',
  \   }
  \ }

" Настройки плагина vim-visual-multi
"let g:VM_quit_after_leaving_insert_mode = 1
let g:VM_silent_exit = 1
