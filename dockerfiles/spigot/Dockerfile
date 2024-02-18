FROM alpine:latest

ENV MC_RAM="4G" \
    JAVA_OPTS="-XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 \
-XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch \
-XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M \
-XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 \
-XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 \
-XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem \
-XX:MaxTenuringThreshold=1 -Dusing.aikars.flags=https://mcflags.emc.gs \
-Daikars.new.flags=true"

RUN apk update \
    && apk add udev \
    && apk add bash \
    && apk add wget \
    && apk add openjdk17-jre \
    && apk cache clean \
    && wget https://raw.githubusercontent.com/LyFl0w/docker-minecraft-server/main/start.sh \
    && apk del wget \
    && mkdir /server

COPY build/spigot-*.jar .

CMD ["bash", "./start.sh"]

EXPOSE 25565/tcp
EXPOSE 25565/udp
VOLUME /server