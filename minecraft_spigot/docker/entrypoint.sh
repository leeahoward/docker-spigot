#!/bin/sh
set -e
set -x

if [ ! -z $EULA ] ; then
  
  echo "eula=$EULA" > $SPIGOT_HOME/eula.txt
  chown minecraft $SPIGOT_HOME/eula.txt 

fi 

exec "$@"