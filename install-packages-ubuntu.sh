#!/bin/bash

echo "Adding repos..."

UBUNTU_DIST=$(lsb_release -cs)

# Required software
sudo apt-get update
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

# Docker
sudo apt-get remove --purge docker docker-engine docker.io
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $UBUNTU_DIST \
   stable"

# .NET Core
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c "echo $(echo \"deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-ubuntu-$UBUNTU_DIST-prod $UBUNTU_DIST main\") > /etc/apt/sources.list.d/dotnetdev.list"

# Yarn
sudo apt-get remove cmdtest
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

# Nodejs
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -

# from https://gist.github.com/lukechilds/a83e1d7127b78fef38c2914c4ececc3c
function get_latest_release() {
  curl --silent "https://api.github.com/repos/$1/releases/latest" | grep -Po '"tag_name": "\K.*?(?=")'
}

echo "Installing kubernetes/minikube"
curl -Lo minikube https://storage.googleapis.com/minikube/releases/$(get_latest_release "kubernetes/minikube")/minikube-linux-amd64 && chmod +x minikube && sudo mv minikube /usr/local/bin/

# Kubectl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
sudo sh -c "echo $(echo \"deb http://apt.kubernetes.io/ kubernetes-xenial main\") > /etc/apt/sources.list.d/kubernetes.list"

echo "Installing packages..."

sudo apt-get update
sudo apt-get -y install \
	nethogs \
	xclip \
	menulibre \
	git \
	tmux \
	mercurial \
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
	ffmpeg \
	kubectl

