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

# Powerline start
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /usr/lib/python3.6/site-packages/powerline/bindings/bash/powerline.sh

# Aliases
if [ -f $HOME/.bash_aliases ]; then
    . $HOME/.bash_aliases
fi

# Functions
if [ -f $HOME/.bash_functions ]; then
    . $HOME/.bash_functions
fi

# Tmux start
if command -v tmux>/dev/null; then
  [[ ! $TERM =~ screen ]] && [ -z $TMUX ] && { tmux attach || exec tmux new-session && exit;}
fi

