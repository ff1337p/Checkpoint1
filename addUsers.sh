#!/bin/bash

# Vérification de la présence d'arguments
if [ $# -eq 0 ]; then
    echo "Il manque les noms d'utilisateurs en argument - Fin du script"
    exit 1
fi

for username in "$@"; do
    if id "$username" > /dev/null 2>&1; then
        echo "L'utilisateur $username existe déjà"
    else
        useradd "$username"
# Vérification si la commande useradd à fonctionné ça echo
        if [ $? -eq 0 ]; then
        echo "L'utilisateur $username à été crée"
    else
        echo "Erreur à la création de l'utilisateur $username"
        fi
    fi
done

# Remarque:
# On renvoie l\'erreur ou les infos dans /dev/null pour pas que cela s\'affiche dans notre terminal
