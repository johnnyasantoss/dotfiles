#!/usr/bin/bash

echo "Adding repos..."

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


