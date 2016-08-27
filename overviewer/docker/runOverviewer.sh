#!/bin/sh

set -e
set -x
while overviewer.py -v --config=/overviewer/config/overviewer.py; do
    echo "Server 'myserver' ended with exit code $?.  Respawning.." >&2
    sleep 10
done