#!/bin/bash

JAR_FILES=("bungeecord/BungeeCord" "papermc/paper-*" "spigot/spigot-*")

for jar_path in "${JAR_FILES[@]}"; do
    dir_name=$(basename "$(dirname "$jar_path")")
    jar_file=$(basename "$jar_path")
    
    docker build -t "server-minecraft:${dir_name}" --build-arg JAR_FILE="${jar_path}" .
    
    if [ $? -eq 0 ]; then
        echo "Image server-minecraft:${dir_name} créée avec succès."
    else
        echo "Erreur lors de la création de l'image server-minecraft:${dir_name}."
    fi
done
