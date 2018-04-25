#!/bin/bash

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# This is for cygwin
[[ "$-" != *i* ]] && return

# Aliases
if [ -f $HOME/.bash_aliases ]; then
    . $HOME/.bash_aliases
fi

if [ -z $POWERLINE_BASH_BINDINGS ]; then
    echo "export POWERLINE_BASH_BINDINGS=`pip3 show powerline-status | grep -i location | cut -d':' -s -f2 | awk '{$1=$1};1'`/powerline/bindings/bash/powerline.sh" >> ~/.bash_env
fi

# Exports
if [ -f $HOME/.bash_env ]; then
    . $HOME/.bash_env
fi

# Functions
if [ -f $HOME/.bash_functions ]; then
    . $HOME/.bash_functions
fi

# Additional path sources

# Powerline start
powerline-daemon -q

# Tmux start
if command -v tmux>/dev/null; then
  [[ ! $TERM =~ screen ]] && [ -z $TMUX ] && { tmux attach || exec tmux new-session && exit;}
fi

if [ -z "$(which kubectl)" ]; then
    source <(kubectl completion bash)
fi
