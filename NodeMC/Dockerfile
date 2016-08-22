FROM node:latest


RUN apt-get update \
	&& apt-get install -y git default-jre \
	&& git clone https://github.com/NodeMC/CORE.git /usr/src/NodeMC \
	&& cd /usr/src/NodeMC \
	&& npm install

WORKDIR /usr/src/NodeMC

COPY ["./docker","/docker"]

RUN chmod +x /docker/*

ENTRYPOINT ["/docker/entrypoint.sh"]

CMD ["node", "Main.js"]