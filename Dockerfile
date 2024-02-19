FROM alpine:latest

ARG JAR_FILE

ENV MC_RAM="4G" \
    JAVA_OPTS=""

COPY start.sh .

RUN apk update \
    && apk add udev \
    && apk add bash \
    && apk add openjdk17-jre \
    && apk cache clean \
    && mkdir /server

COPY build/${JAR_FILE}.jar .

CMD ["bash", "./start.sh"]

EXPOSE 25565/tcp
EXPOSE 25565/udp
VOLUME /server