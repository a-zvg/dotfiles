HISTSIZE=10000
HISTFILESIZE=10000

gitb() {
     git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

if [ "$color_prompt" = yes ]; then
    PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\e[91m\]\$(gitb)\[\033[00m\]\$ "
else
    PS1="${debian_chroot:+($debian_chroot)}\u@\h:\w\$(gitb)\$ "
fi

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

stty -ixon # отключить комбинации ctrl-s/ctrl-q
export PATH="$HOME/bin:$PATH"
