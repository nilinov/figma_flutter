#!/usr/bin/env bash
set -e && set -x

./update.sh

echo '$1' >> /home/flutter/flutter_visible/demo.txt

screen -S ServerFault -p 0 -X stuff "R"

