#!/bin/sh

cd ~/OpenWPM/openwpm-mods

#  Make conda available to shell script
eval "$(conda shell.bash hook)"
conda activate openwpm


DATADIRPATH=~/datadir

python tranco_crawl.py $DATADIRPATH 0 10