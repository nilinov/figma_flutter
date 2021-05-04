#!/usr/bin/env bash
set -e && set -x

# update
git fetch origin
git reset --hard origin/master
flutter pub get

# start
flutter run -d web-server --web-port 3000

