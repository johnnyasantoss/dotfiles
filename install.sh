#!/usr/bin/env bash

BASEDIR=$(realpath `dirname "$0"`)
echo $BASEDIR
echo "Using base directory '$BASEDIR'"
echo
echo "Creating symlinks..."

for f in $BASEDIR/.*
do
    [ -f "$f" ] && ln -vsf $f ~/
done

rm -f ~/.gitignore

sleep 2
echo
echo "Installing fonts..."

mkdir -m=755 ~/.local/share/fonts > /dev/null
cd ~/.local/share/fonts

echo
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

echo
echo "Rebuilding font cache..."
fc-cache -f -v

cd $BASEDIR

echo
echo "Installing all the software I need..."
# TODO: This needs to be platform agnostic
DEPS="
git 
tmux 
vim 
docker 
mono 
nodejs 
npm
"
MACHINE_INFO=`uname -a`

if [[ $MACHINE_INFO == *"MANJARO"* ]]; then
    sudo pacman -Syu $DEPS
elif [[ $MACHINE_INFO == *"UBUNTU"* ]]; then
    sudo apt-get update -qq
    sudo apt-get install -y $DEPS
elif [[ $MACHINE_INFO == *"FEDORA"* ]]; then
    sudo dnf update
    sudo dnf install -y $DEPS
fi
sudo pip install powerline-status

