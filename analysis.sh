#!/bin/sh

cd ~/OpenWPM/OpenWPMDataAnalytics
#  Make conda available to shell script
eval "$(conda shell.bash hook)"
conda activate openwpmdata

DATADIRPATH=~/datadir

python control.py $DATADIRPATH