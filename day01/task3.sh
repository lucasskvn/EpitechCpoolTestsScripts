#!/usr/bin/env bash

DIRECTORY="${1:-.}"

if [ ! -d "$DIRECTORY" ]; then
    echo "Erreur : Le répertoire $DIRECTORY n'existe pas"
    exit 1
fi

if [ ! -f "$DIRECTORY/midLS" ]; then
    echo "Erreur : Le fichier midLS n'existe pas dans $DIRECTORY"
    exit 1
fi

chmod +x "$DIRECTORY/midLS"

output1=$(cd "$DIRECTORY" && ./midLS 2>&1)
output2=$(cd "$DIRECTORY" && ls --file-type -p -B -I"#*" -m 2>&1)

if [ "$output1" = "$output2" ]; then
    echo "Test réussi : Les sorties sont identiques"
    exit 0
else
    echo "Test échoué : Les sorties sont différentes"
    echo ""
    echo "Sortie de midLS :"
    echo "$output1"
    echo ""
    echo "Sortie de ls :"
    echo "$output2"
    exit 1
fi