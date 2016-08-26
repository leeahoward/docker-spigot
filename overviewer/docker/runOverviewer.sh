#!/bin/sh

set -e
set -x
while myserver; do
    echo "Server 'myserver' ended with exit code $?.  Respawning.." >&2
    overviewer.py -v --config=/overviewer/overviewer.py
	sed -i 's/\?sensor=false\"/\&key=$MAPS_API_KEY\"/g' 
    sleep 10
done