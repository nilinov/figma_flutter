#!/usr/bin/env bash
set -e && set -x

git fetch origin
git reset --hard origin/main
flutter pub get

screen -S ServerFault -p 0 -X stuff "R"
