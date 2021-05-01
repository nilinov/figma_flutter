#!/usr/bin/env bash
set -e && set -x

sed $'s/\r$//' ./start.sh > ./start.unix.sh

sudo apt-get install unzip

sudo apt-get install screen

sudo apt install dos2unix

mkdir ~/.screen && chmod 700 ~/.screen

export SCREENDIR=$HOME/.screen

#sudo find . -type f -name "*.sh" -exec dos2unix {} \;
