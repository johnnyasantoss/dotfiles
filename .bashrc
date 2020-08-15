#!/bin/bash

# Return if not in an interactive instance
[[ "$-" != *i* ]] && return

# Tmux start

if [ -z "$TMUX_SESSION" ]; then
    TMUX_SESSION="local"
fi

if [ ! "$TMUX_SESSION" = "nop" ] && [ -x "$(command -v tmux)" ] && [[ ! "$TERM" =~ screen ]] && [ -z "$TMUX" ]; then
    tmux attach -t "$TMUX_SESSION" || tmux new -s "$TMUX_SESSION"
fi

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Functions
if [ -f $HOME/.bash_functions ]; then
    . $HOME/.bash_functions
fi

# Aliases
if [ -f $HOME/.bash_aliases ]; then
    . $HOME/.bash_aliases
fi

# Exports
if [ -f $HOME/.bash_env ]; then
    . $HOME/.bash_env
fi

if [ -f $HOME/.bash_env_local ]; then
    . $HOME/.bash_env_local
else
    echo "Generating powerline bash bindings..."
    bash_bindings="export POWERLINE_BASH_BINDINGS=`python3 -m pip show powerline-status | grep -i location | cut -d':' -s -f2 | awk '{$1=$1};1'`/powerline/bindings/bash/powerline.sh"
    echo -e $bash_bindings >> $HOME/.bash_env_local
    eval $bash_bindings
fi

# Powerline start
if [ -x "$(command -v powerline-daemon)" ]; then
    source $POWERLINE_BASH_BINDINGS
    powerline-daemon -q
fi

# Completion
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

