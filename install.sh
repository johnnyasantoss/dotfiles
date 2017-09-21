#!/usr/bin/env bash

BASEDIR=$(realpath `dirname "$0"`)
echo $BASEDIR
echo "Creating symlinks..."

for f in $BASEDIR/.*
do
    [ -f "$f" ] && ln -vsf $f ~/
done

rm -f ~/.gitignore
