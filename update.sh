#!/usr/bin/env bash
set -e && set -x

# Absolute path to this script. /home/user/bin/foo.sh
SCRIPT=$(readlink -f $0)
# Absolute path this script is in. /home/user/bin
DIR=`dirname $SCRIPT`
cd $DIR

git fetch origin
git reset --hard origin/main
flutter pub get

flutter build web
