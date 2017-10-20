#!/usr/bin/bash

echo "Adding repos..."

# VsCode
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

sudo wget https://dl.yarnpkg.com/rpm/yarn.repo -O /etc/yum.repos.d/yarn.repo
curl --silent --location https://rpm.nodesource.com/setup_8.x | sudo bash -


echo "Installing packages..."

sudo dnf -y install \
	nethogs \
	xclip \
	menulibre \
	git \
	tmux \
	mercurial \
	vim-enhanced \
	p7zip-plugins \
	nodejs \
	docker-ce \
	yarn \
	gcc-c++ \
	make \
	code


