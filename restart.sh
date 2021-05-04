#!/usr/bin/env bash
set -e && set -x

echo "$1" > /home/flutter/flutter_visible/lib/demo_widget.dart

./update.sh

screen -S ServerFault -p 0 -X stuff "R"

