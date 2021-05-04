#!/usr/bin/env bash
set -e && set -x

echo "$1" > /home/flutter/flutter_visible/demo.txt

echo "$1"

./update.sh

screen -S ServerFault -p 0 -X stuff "R"

