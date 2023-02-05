#!/bin/bash

if [ -z "$BASH_VERSION" ]; then
    echo "This script is required to be ran with the bash shell via bash -i SCRIPT"
    exit 1
fi
if [ -z "$PS1" ]; then
    echo "This script is required to be ran interactivly via bash -i SCRIPT"
    exit 1
fi


apt update
apt upgrade
apt install apt-utils
apt install build-essential
apt install coreutils
apt install git
apt install manpages-dev
apt install wget
apt install curl
apt install make


# VS Code
wget https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64 -O - | apt install - 

# docker
wget https://get.docker.com -O - | sh -

# gcloud
snap remove google-cloud-sdk
snap install google-cloud-cli --classic
gcloud init

# micromamba
wget micro.mamba.pm/install.sh -O - | bash -
source ~/.bashrc
echo "successfully installed micromamba $(micromamba --version)"


# ssh:
ssh-keygen
echo $(cat ~/.ssh/id_rsa.pub)
echo "copy the above public key to git hosting providers, and press enter to continue"
read EMPTY

# cloning repo's
mkdir ~/OpenWPM

cd ~/OpenWPM
git clone git@github.com:tim-stephenson/OpenWPM-Data-Analytics.git
cd ~/OpenWPM/OpenWPM-Data-Analytics
bash -i install.sh

cd ~/OpenWPM
git clone git@gitlab.com:wesleyancs-plp/openwpm-mods.git --branch timothy
cd ~/OpenWPM/openwpm-mods
sh install.sh
