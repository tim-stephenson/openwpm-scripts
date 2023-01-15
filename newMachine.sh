#!/bin/bash

cd "$(dirname $0)"

sudo apt update
sudo apt upgrade
sudo apt install build-essential
sudo apt install git
sudo apt install manpages-dev
sudo apt install wget
sudo apt install make
sudo apt install apt-utils
sudo apt install curl
sudo apt install libx11-xcb1 

# docker
wget https://get.docker.com --output-document=get-docker.sh
sudo sh get-docker.sh
rm get-docker.sh


# conda
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh --output-document=Miniconda3-latest-Linux-x86_64.sh
rm -r  ~/miniconda3
bash Miniconda3-latest-Linux-x86_64.sh
rm Miniconda3-latest-Linux-x86_64.sh
source ~/.bashrc
conda config --set auto_activate_base false
conda update conda
echo $(conda --version)

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
sh install.sh

cd ~/OpenWPM
git clone git@gitlab.com:wesleyancs-plp/openwpm-mods.git --branch timothy
cd ~/OpenWPM/openwpm-mods
sh install.sh