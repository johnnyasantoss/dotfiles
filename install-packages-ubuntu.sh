#!/bin/bash

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

UBUNTU_DIST=$(lsb_release -cs)

echo "Installing required software..."
sudo apt-get update
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

# Docker
if ! [ -f "/etc/apt/sources.list.d/docker-ce.list" ]; then
    sudo apt-get remove --purge docker docker-engine docker.io
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository \
       "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
       $UBUNTU_DIST \
       stable"
fi

# .NET Core
if ! [ -f "/etc/apt/sources.list.d/packages-microsoft-prod.list" ]; then
    echo "Adding .NET Core sources..."
    wget -q https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/packages-microsoft-prod.deb
    sudo dpkg -i packages-microsoft-prod.deb
fi

# Yarn
if ! [ -f "/etc/apt/sources.list.d/yarn.list" ]; then
    echo "Adding Yarn repo..."
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
fi

# Nodejs
if ! [ -x "$(command -v node)"  ]; then
    echo "Adding NodeJS repo..."
    sudo sh -c 'curl --silent --location https://rpm.nodesource.com/setup_10.x | bash -'
fi

# from https://gist.github.com/lukechilds/a83e1d7127b78fef38c2914c4ececc3c
function get_latest_release() {
  curl --silent "https://api.github.com/repos/$1/releases/latest" | grep -Po '"tag_name": "\K.*?(?=")'
}

if ! [ -x "$(command -v minikube)"  ] && prompt_confirm "Install Minikube?"; then
    echo "Installing kubernetes/minikube"
    curl -Lo minikube https://storage.googleapis.com/minikube/releases/$(get_latest_release "kubernetes/minikube")/minikube-linux-amd64 && chmod +x minikube && sudo mv minikube /usr/local/bin/
fi

# Kubectl
#curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
#sudo sh -c "echo $(echo \"deb http://apt.kubernetes.io/ kubernetes-xenial main\") > /etc/apt/sources.list.d/kubernetes.list"

# Rust
if ! [ -x "$(command -v rustc)"  ]; then
    echo "Installing Rust Toolchain..."
    curl https://sh.rustup.rs -sSf | sh

    cargo install \
        bat \
        peep
fi

echo "Installing packages..."

prompt_confirm "Install Shodan?" && sudo easy_install -U shodan

prompt_confirm "Install VPN?" && sudo apt -y install \
    openvpn \
    dialog \
    wget \
    sysctl \
    sha512sum \
    && curl -SfLO "https://github.com/ProtonVPN/protonvpn-cli/raw/master/protonvpn-cli.sh" \
    && sudo bash protonvpn-cli.sh --install \
    && rm protonvpn-cli.sh


sudo apt-get update
sudo apt-get -y install \
	nethogs \
	xclip \
	git \
	tmux \
	vim \
	p7zip-full \
	nodejs \
	build-essential \
	docker-ce \
	yarn \
	mono-complete \
	gnome-tweak-tool \
	openvpn \
	^dotnet-sdk-* \
	flatpak \
	gstreamer1.0-plugins-bad \
	gstreamer1.0-plugins-good \
	ffmpeg

