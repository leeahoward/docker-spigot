#!/bin/sh
set -x
set -e

if [ ! -f /overviewer/textures/$TEXTURES_VERSION.jar ]; then
	wget https://s3.amazonaws.com/Minecraft.Download/versions/$TEXTURES_VERSION/$TEXTURES_VERSION.jar -P /overviewer/textures/
fi


exec "$@"