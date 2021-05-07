#!/usr/bin/env bash
set -e && set -x

# update
chmod +x update.sh
./update.sh

# start
#flutter run -d web-server --web-port 3000
flutter run -d linux

