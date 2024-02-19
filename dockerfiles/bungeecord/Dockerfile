FROM alpine:latest

ENV MC_RAM="4G" \
    JAVA_OPTS=""

RUN apk update \
    && apk add udev \
    && apk add bash \
    && apk add wget \
    && apk add openjdk17-jre \
    && apk cache clean \
    && wget https://raw.githubusercontent.com/LyFl0w/docker-minecraft-server/main/start.sh \
    && apk del wget \
    && mkdir /server

COPY build/BungeeCord.jar .

CMD ["bash", "./start.sh"]

EXPOSE 25565/tcp
EXPOSE 25565/udp
VOLUME /server