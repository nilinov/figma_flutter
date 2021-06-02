#!/usr/bin/env bash
set -e && set -x

git fetch origin
git reset --hard origin/main
flutter pub get

flutter build web
