#!/usr/bin/env bash
set -e && set -x

./update.sh

echo '$1'

screen -S ServerFault -p 0 -X stuff "R"
