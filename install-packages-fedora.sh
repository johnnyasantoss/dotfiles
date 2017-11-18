#!/usr/bin/bash

echo "Adding repos..."
# Docker
sudo dnf -y install dnf-plugins-core
sudo dnf config-manager \
	    --add-repo \
	        https://download.docker.com/linux/fedora/docker-ce.repo

# .NET Core
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[packages-microsoft-com-prod]\nname=packages-microsoft-com-prod \nbaseurl=https://packages.microsoft.com/yumrepos/microsoft-rhel7.3-prod\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/dotnetdev.repo'

# VsCode
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

# Yarn
sudo wget https://dl.yarnpkg.com/rpm/yarn.repo -O /etc/yum.repos.d/yarn.repo

# Nodejs
curl --silent --location https://rpm.nodesource.com/setup_8.x | sudo bash -

echo "Installing packages..."

sudo easy_install -U shodan

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
	mono-devel \
	gnome-tweak-tool \
	gstreamer \
	gstreamer-plugins-good \
	gstreamer-plugins-bad \
	code \
	openvpn \
	libunwind \
	libicu \
	compat-openssl10 \
	dotnet-sdk-2.0.2 \
	flatpak

