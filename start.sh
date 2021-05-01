#!/usr/bin/env bash
set -e && set -x

#screen -r ServerFault

flutter run -d web-server --web-port 3000
