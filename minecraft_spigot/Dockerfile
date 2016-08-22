FROM ubuntu:trusty

MAINTAINER Lee Howard <leeahoward@gmail.com>

# add some needed commands 
RUN apt-get update && \
	apt-get install -y wget git openjdk-7-jre-headless tar && \
	apt-get clean all && \
	mkdir /minecraft


ENV MC_USER minecraft # user for minecraft to run under
ENV MC_PROC spigot.jar # name of minecraft jar file
ENV MC_DIR /minecraft/ # direcotry where the server should run
ENV MC_VERSION latest  # version to build
ENV SPIGOT_HOME /spigot # where to compile the jar file

# add extra files needed to build and run
COPY /docker /docker

# Make special user for minecraft to run in
RUN useradd -s /bin/bash -d /minecraft -m minecraft

# expose minecraft port
EXPOSE 25565

WORKDIR /minecraft

RUN set -x && \
	set -e && \
	rm /bin/sh && \
	ln -s /bin/bash /bin/sh && \
	chmod +x ./minecraft_server.sh && \
	chmod +x ./entrypoint.sh && \
	chown minecraft /minecraft


# build the default latest spigot jar file
RUN set -x && \
	set -e && \
	mkdir /spigot && \
	chown minecraft /spigot && \
	./minecraft_server.sh create

ENTRYPOINT ["/docker/entrypoint.sh"]

CMD ["/docker/minecraft_server.sh","start"]