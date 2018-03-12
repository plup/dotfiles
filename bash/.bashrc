# If not running interactively, don't do anything
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

# Xterm support 256 colors
export TERM=xterm-256color

function color_my_prompt {
    local __user_and_host="\[\033[01;32m\]\u@\h"
    local __cur_location="\[\033[01;34m\]\w"
    local __git_branch_color="\[\033[31m\]"
    local __git_branch='`git branch 2> /dev/null | grep -e ^* | sed -E  s/^\\\\\*\ \(.+\)$/\(\\\\\1\)\ /`'
    local __prompt_tail="\n\[\033[35m\]$"
    local __last_color="\[\033[00m\]"
    export PS1="$__user_and_host:$__cur_location $__git_branch_color$__git_branch$__prompt_tail$__last_color "
}
color_my_prompt

# Commands
alias compta="vi ~/administratif/freelance/compta"
alias sniff='curl -w "@$HOME/doc/scripts/curl_sniff.format" -o /dev/null -O --remote-name --remote-header-name -sL'
alias pass-security="PASSWORD_STORE_DIR=~/.pass/security PASSWORD_STORE_GIT=~/.pass/security pass"
alias genpass="echo $(< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c12)"
