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

# set the prompt
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

set_my_prompt() {
    local time="\[\033[01;32m\][\t]"
    local user_and_host="\[\033[01;32m\]\u@\h"
    local cur_location="\[\033[01;34m\]\w"
    local git_branch_color="\[\033[31m\]"
    local prompt_tail="\n\[\033[35m\]$"
    local last_color="\[\033[00m\]"
    export PS1="$time $user_and_host:$cur_location $git_branch_color\$(get_git_info)$prompt_tail$last_color "
}
set_my_prompt

# commands I need everywhere
alias sniff='curl -w "@$HOME/doc/scripts/curl_sniff.format" -o /dev/null -O --remote-name --remote-header-name -sL'
alias genpass="echo $(< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c12)"

# set default behavior

# python version for pipenv
PIPENV_DEFAULT_PYTHON_VERSION=3.6

# use urxvt terminal if available
if [ -f /usr/bin/urxvt ]; then
    export TERM=rxvt-unicode
else
    export TERM=xterm-256color
fi


# extra local commands (right place for local overrides)
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
