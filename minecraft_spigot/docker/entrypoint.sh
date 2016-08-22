#!/bin/sh
set -e
set -x

if [ ! -z $EULA ] ; then
  
  echo "eula=$EULA" > $SPIGOT_HOME/eula.txt
  chown minecraft $SPIGOT_HOME/eula.txt 

fi 

if [ ! -f $SPIGOT_JAR ] ; then
  
	echo "spigot jar file was not found ($SPIGOT_JAR)"
	./minecraft_server.sh create
fi 

# if a jar file exists then replace it with the specified $SPIGOT_JAR
if [ -f $MC_PROC ] ; then
 	rm $MC_PROC 
fi 

mkdir -p $MC_PROC_DIR

cp $SPIGOT_JAR $MC_PROC_DIR

exec "$@"