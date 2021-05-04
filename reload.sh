#!/usr/bin/env bash
set -e && set -x

./update.sh

screen -S ServerFault -p 0 -X stuff "r"
