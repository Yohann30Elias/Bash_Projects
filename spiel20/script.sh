#!/bin/bash
# 2024 Yohann Riond
# 20 gewint Spiel für den Herr Vogel
# Thymio will des hier unbedingt aber hat keine Parameter

spielstand=0

#loop
while true; do

    #player
    while true; do
        read -p "Ihr Versuch: " versuch
        if [[ $versuch -gt 20 ]]; then
            echo "Das ist mehr als erlaubt"
        elif [[ $versuch -eq (($versuch+1)) ]] || [[ $versuch -eq (($versuch+2)) ]]; then
            break
        else
            echo "Das ist nicht gültig"
        fi
    done

    #spielstand update
    spielstand=$versuch
    if [[ $spielstand -eq 20 ]]; then
        echo "Wow, du hast gewonnen!"
        exit 1
    fi
    
    #pc
    if [[ $spielstand -gt 17 ]]; then
        spielstand=20
    else
        spielstand =$ ((spielstand + RANDOM % 2 + 1))
    fi

    if [[ $spielstand -eq 20 ]]; then 
        echo "Der Computer hat Gewonnen!"
        exit 2
    fi

done