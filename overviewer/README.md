# Overviewer for Docker

Purpose
=======================================
Run minecraft overviewer to generate map data in a docker container

Usage
---
1. Clone the repo
2. Customize the docker-compose.yml file
3. docker-compose up

# Configuring the container
Default mount points for volumes
--
1. minecraft data volume
   - this is where your minecraft world data is stored.  It can be a copy of your minecraft world or a volume that is shared with your minecraft server 
   - /minecraft/data
2. overviewer data folder
   - This is where overviewer will store the map data and should be made available to your webserver if you want to server the overviewer data
   - /overviewer/data
 3. overviewer config
    - Your overviewer config file
    - /overviewer/overviewer.py 

Environment Variables
--

1. MAPS_API_KEY
   - You need to generate an api key for maps with google. You can specify that key here and it will be injected into your index.html file
2. TEXTURES_VERSION
   - The version of minecraft that your map is used with.  There will be errors if this does not match your server version.

Example run with docker-compose
------

```yml
version: "2"
services:
  webserver:
  	restart: always
    image: nginx:alpine
    ports:
      - "80:80"
    volumes:
      - ./data/overviewer/worlds:/usr/share/nginx/html

  overviewer:
  	restart: always
    build: overviewer
    volumes:
      - ./data/minecraft/worlds/josh:/minecraft/worlds/josh
      - ./data/overviewer/worlds/josh:/overviewer/worlds/josh
      - ./config/overviewer.py:/overviewer/overviewer.py
    environment: 
      MAPS_API_KEY: "************" #<-- your key here
      TEXTURES_VERSION: "1.10" #<-- your minecraft version
```