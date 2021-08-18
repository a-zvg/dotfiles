alias mc='source /usr/lib/mc/mc-wrapper.sh'
alias ..='cd ..'
alias -- -='cd -'
alias l='ls -Ap --color=auto --group-directories-first -w100'
alias ll='ls -lAp --color=auto --group-directories-first'
alias ls='ls -p --color=auto --group-directories-first -w100'
alias h='history | fzf --tac'
alias go='. go'
alias v='vim'
alias gith='git lg | head'
alias config='git --git-dir=$HOME/.dotfiles/.git --work-tree=$HOME'
alias psa="ps ajxf | awk '{ if(\$2 == \$4) { if (\$1 == 1) { print \"\033[35m\" \$0\"\033[0m\"}  else print \"\033[1;32m\" \$0\"\033[0m\" } else print \$0 }'"
alias psu="ps jxf | awk '{ if(\$2 == \$4) { if (\$1 == 1) { print \"\033[35m\" \$0\"\033[0m\"}  else print \"\033[1;32m\" \$0\"\033[0m\" } else print \$0 }'"
