alias ..='cd ..'
alias -- -='cd -'
alias l='ls -Ap --color=auto --group-directories-first -w100'
alias go='. go'
alias gv='gtags && vim'
alias cy='xclip -selection clipboard'
alias cp='xclip -selection clipboard -o'
alias sl="( find -regex '.*\.\(h\|hpp\|c\|cpp\)$' -print0 | xargs -0 cat ) | wc -l"
