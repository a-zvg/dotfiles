# My bashrc config file.
# Подключить в ~/.bashrc, добавив в его конец строки:
#if [ -f ~/.dotfiles/.bashrc ]; then
#    . ~/.dotfiles/.bashrc
#fi

# history setting
HISTSIZE=10000
HISTFILESIZE=10000
PROMPT_COMMAND="history -a" # write new line in history after each command
HISTCONTROL=ignoreboth:erasedups # duplicate lines to not be saved
HISTTIMEFORMAT='%d.%m.%Y %H:%M:%S  ' # add date for history lines

gitb() {
    git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\e[91m\]\$(gitb)\[\033[00m\]\$ "

unalias -a
. ~/.bash_aliases

stty -ixon # отключить комбинации ctrl-s/ctrl-q
export PATH="$HOME/bin:$PATH"

function cd {
    builtin cd "$@" && ls
}
