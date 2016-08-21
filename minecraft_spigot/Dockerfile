FROM ubuntu:trusty

MAINTAINER Lee Howard <leeahoward@gmail.com>

# add some needed commands 
RUN apt-get update && \
	apt-get install -y wget git openjdk-7-jre-headless tar && \
	apt-get clean all && \
	mkdir /minecraft


#default directory for SPIGOT-server
ENV SPIGOT_HOME /minecraft

#default version 
ENV SPIGOT_VER latest

# add extra files needed
COPY /docker /docker


# Make special user for minecraft to run in

RUN useradd -s /bin/bash -d /minecraft -m minecraft


# expose minecraft port
EXPOSE 25565



WORKDIR /docker


RUN rm /bin/sh && ln -s /bin/bash /bin/sh&&set -x&& \
	set -e && \
	chmod +x ./minecraft_server.sh && \
	chmod +x ./entrypoint.sh&& \
	chown minecraft /minecraft &&\
	ls -la

ENV SPIGOT_HOME /spigot
ENV MC_VERSION latest
RUN set -x&&set -e && \
	mkdir /spigot && \
	chown minecraft /spigot && \
	./minecraft_server.sh create

ENTRYPOINT ["/docker/entrypoint.sh"]

CMD ["/docker/minecraft_server.sh","start"]