#!/usr/bin/env bash

BASEDIR=$(realpath `dirname "$0"`)
echo $BASEDIR
echo "Creating symlinks..."

for f in $BASEDIR/.*
do
    [ -f "$f" ] && ln -vsf $f ~/
done

rm -f ~/.gitignore

echo "Installing fonts..."

mkdir -m=755 ~/.local/share/fonts > /dev/null
cd ~/.local/share/fonts

# Powerline font
curl -O https://raw.githubusercontent.com/powerline/powerline/develop/font/PowerlineSymbols.otf

# Firacode

curl -O https://raw.githubusercontent.com/tonsky/FiraCode/master/distr/otf/FiraCode-Bold.otf
curl -O https://raw.githubusercontent.com/tonsky/FiraCode/master/distr/otf/FiraCode-Light.otf
curl -O https://raw.githubusercontent.com/tonsky/FiraCode/master/distr/otf/FiraCode-Medium.otf
curl -O https://raw.githubusercontent.com/tonsky/FiraCode/master/distr/otf/FiraCode-Regular.otf
curl -O https://raw.githubusercontent.com/tonsky/FiraCode/master/distr/otf/FiraCode-Retina.otf

# Change the font files permissions
for f in ./*.otf
do
    [ -f "$f" ] && chmod 755 $f
done

echo "Rebuilding font cache..."
fc-cache -f -v

cd $BASEDIR

echo "Installing powerline..."
sudo pip install powerline-status


