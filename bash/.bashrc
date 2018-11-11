# if not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
shopt -s checkwinsize

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias egrep='egrep --color=auto'
fi

# function to detect git status
get_git_info() {
    local branch_name
    local state
    if $(git rev-parse --is-inside-work-tree &> /dev/null); then
        # Get the short symbolic ref
        branch_name=$(git symbolic-ref --quiet --short HEAD 2> /dev/null) ||
        # If HEAD isn't a symbolic ref, get the short SHA
        branch_name=$(git rev-parse --short HEAD 2> /dev/null) ||
        # Otherwise, just give up
        branch_name="unknown"
        # Check for unstaged changes
        if ! $(git diff-files --quiet --ignore-submodules --); then us="!"; fi
        # Check for untracked files
        if [ -n "$(git ls-files --others --exclude-standard)" ]; then ut="?"; fi
        # Check for stashed files
        if $(git rev-parse --verify refs/stash &>/dev/null); then st="$"; fi
        state=$uc$us$ut$st
        if [[ $state ]];then
            printf "($branch_name[$state])"
        else
            printf "($branch_name)"
        fi
    fi
}

# set the prompt
export PS1="\[\033[38;5;247m\][\t] \u@\h:\[\033[01;34m\]\w \[\033[31m\]\$(get_git_info)\n\[\033[35m\]$\[\033[00m\] "

# python version for pipenv
export PIPENV_DEFAULT_PYTHON_VERSION=3.6

# add pip user installed binaries and local scripts to PATH
export PATH="$HOME/.scripts:$HOME/.local/bin:$PATH"

# use urxvt terminal if available
if [ -f /usr/bin/urxvt ]; then
    export TERM=rxvt-unicode
else
    export TERM=xterm-256color
fi

# set bash completion
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# commands I need everywhere
alias genpass="echo $(< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c12)"

if [ -f "$HOME/.config/todo.cfg" ]; then
    alias td="todo-txt -d $HOME/.config/todo.cfg"
fi

man() {
    env LESS_TERMCAP_mb=$'\E[01;31m' \
        LESS_TERMCAP_md=$'\E[01;38;5;74m' \
        LESS_TERMCAP_me=$'\E[0m' \
        LESS_TERMCAP_se=$'\E[0m' \
        LESS_TERMCAP_so=$'\E[38;5;246m' \
        LESS_TERMCAP_ue=$'\E[0m' \
        LESS_TERMCAP_us=$'\E[04;38;5;146m' \
        man "$@"
}
# extra local commands (right place for local overrides)
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
