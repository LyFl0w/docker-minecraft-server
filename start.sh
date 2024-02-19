#!/bin/bash

# Supprimer le fichier JAR dans le répertoire "server" s'il existe
if [ -f "server/*.jar" ]; then
    rm server/*.jar
fi

chmod 770 -R /server
chown -R root:sudo /server

JAR_FILE=$(ls *.jar)

mv $JAR_FILE server/
cd server

echo "eula=true" > eula.txt

if [[ -n $MC_RAM ]]
then
  JAVA_OPTS="-Xms${MC_RAM} -Xmx${MC_RAM} $JAVA_OPTS"
fi

# Start server
exec java $JAVA_OPTS -jar "$JAR_FILE"
