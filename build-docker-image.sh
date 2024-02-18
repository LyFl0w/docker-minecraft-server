#!/bin/bash

# Parcourir tous les sous-dossiers dans le répertoire des Dockerfiles
for subdir in "dockerfiles"/*/; do
    # Extraire le nom du sous-dossier (dernière partie du chemin)
    dir_name=$(basename "$subdir")

    # Construire l'image Docker avec le nom spécifié
    docker build -t "server-minecraft:$dir_name" "$subdir"
    
    # Vérifier si la construction de l'image a réussi
    if [ $? -eq 0 ]; then
        echo "Image server-minecraft:$dir_name créée avec succès."
    else
        echo "Erreur lors de la création de l'image server-minecraft:$dir_name."
    fi
done