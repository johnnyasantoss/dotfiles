#!/usr/bin/bash

prompt_confirm() {
  while true; do
    read -r -n 1 -p "${1:-Continue?} [y/n]: " REPLY
    case $REPLY in
      [yY]) echo ; return 0 ;;
      [nN]) echo ; return 1 ;;
      *) printf " \033[31m %s \n\033[0m" "invalid input"
    esac 
  done  
}

echo "Adding repos..."

# .NET Core
if ! [ -f "/etc/yum.repos.d/microsoft-prod.repo" ]; then
	echo "Adding .NET Core repo..."
	sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
	wget -q https://packages.microsoft.com/config/fedora/27/prod.repo
	sudo mv prod.repo /etc/yum.repos.d/microsoft-prod.repo
	sudo chown root:root /etc/yum.repos.d/microsoft-prod.repo
fi

# VsCode
if ! [ -f "/etc/yum.repos.d/vscode.repo" ]; then
	echo "Adding VSCode repo..."
	sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
	sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
fi

# Yarn
if ! [ -f "/etc/yum.repos.d/yarn.repo" ]; then
	echo "Adding Yarn repo..."
	sudo sh -c 'curl --silent --location https://dl.yarnpkg.com/rpm/yarn.repo > /etc/yum.repos.d/yarn.repo'
fi

# Nodejs
if ! [ -x "$(command -v node)"  ]; then
	echo "Adding NodeJS repo..."
	sudo sh -c 'curl --silent --location https://rpm.nodesource.com/setup_10.x | bash -'
fi

# Rust
if ! [ -x "$(command -v node)"  ]; then
	echo "Installing Rust Toolchain..."
	curl https://sh.rustup.rs -sSf | sh
fi

echo "Installing packages..."

prompt_confirm "Install Shodan?" && sudo easy_install -U shodan

prompt_confirm "Install OpenVPN?" && sudo dnf -y install openvpn

sudo dnf -y install \
	nethogs \
	xclip \
	menulibre \
	git \
	tmux \
	vim-enhanced \
	p7zip-plugins \
	nodejs \
	podman \
	yarn \
	gcc-c++ \
	make \
	mono-devel \
	gnome-tweak-tool \
	gstreamer \
	gstreamer-plugins-good \
	gstreamer-plugins-bad \
	code \
	libunwind \
	libicu \
	compat-openssl10 \
	flatpak \
	gstreamer-plugins-bad \
	gstreamer-plugins-good \
	gstreamer-ffmpeg \
	ffmpeg \
	workrave
