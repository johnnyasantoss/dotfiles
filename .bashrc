#!/bin/bash

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# This is for cygwin
[[ "$-" != *i* ]] && return

# Ignora no histórico linhas vazias, exit, ls e duplicatas
export HISTIGNORE=$'[ \t]*:&:[fb]g:exit:ls'
export MAINTAINER="johnnyadsantos@gmail.com"
export EDITOR="vim"
export VISUAL="vim"

# Powerline start
if [ -x "$(command -v powerline-daemon)"  ]; then
    powerline-daemon -q
    POWERLINE_BASH_CONTINUATION=1
    POWERLINE_BASH_SELECT=1
    POWERLINE_BASE_PATH=$(pip show powerline-status | grep -i location | cut -d':' -s -f2 | awk '{$1=$1};1')
    . $POWERLINE_BASE_PATH/powerline/bindings/bash/powerline.sh
fi

# Aliases
if [ -f $HOME/.bash_aliases ]; then
    . $HOME/.bash_aliases
fi

# Functions
if [ -f $HOME/.bash_functions ]; then
    . $HOME/.bash_functions
fi

# Additional path sources
if [ -d "$HOME/.yarn/bin" ]; then
    export PATH=$PATH:"$HOME/.yarn/bin"
fi

if [ -d "${HOME}/.bin" ] ; then
  export PATH="${HOME}/.bin:${PATH}"
fi

if [ -d "${HOME}/.cargo/bin" ] ; then
  export PATH="$HOME/.cargo/bin:$PATH"
fi

# Tmux start
if command -v tmux>/dev/null; then
    [[ ! $TERM =~ screen ]] && [ -z $TMUX ] && { tmux attach || exec tmux new-session && exit;}
fi

# K8s
if [ -x "$(command -v kubectl)"  ]; then
    source <(kubectl completion bash)
fi
