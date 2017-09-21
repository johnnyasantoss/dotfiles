#!/bin/bash

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# This is for cygwin
[[ "$-" != *i* ]] && return

# Ignora no histórico linhas vazias, exit, ls e duplicatas
export HISTIGNORE=$'[ \t]*:&:[fb]g:exit:ls'

# Alias
if [ -f $HOME/.bash_aliases ]; then
    . $HOME/.bash_aliases
fi

# Funções
if [ -f $HOME/.bash_functions ]; then
    . $HOME/.bash_functions
fi
