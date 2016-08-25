FROM ubuntu:trusty

RUN set -x \
	&& apt-get update -qq
RUN set -x \
	&& apt-get install -y -qq software-properties-common \
	&& add-apt-repository ppa:fkrull/deadsnakes \
	&& apt-get update -qq\
	&& apt-get install -y wget python2.6 python2.6-dev\
	&& cat /etc/apt/sources.list \
	&& echo deb http://overviewer.org/debian ./>>/etc/apt/sources.list \
	&& cat /etc/apt/sources.list \
 	&& wget -O - http://overviewer.org/debian/overviewer.gpg.asc | sudo apt-key add -

RUN apt-get update -qq \
 	&& apt-get install -y minecraft-overviewer


COPY ["./docker","/docker"]

RUN chmod +x ./docker/*.sh
RUN ls -la /docker

ENTRYPOINT ["./docker/entrypoint.sh"]