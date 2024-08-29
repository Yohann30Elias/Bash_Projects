#!/bin/bash
# 2024 YR
# 20 Gewinnt wo PC immer gewinnt für Herrn Vogel
# Para was für meter

spielstand=0

echo "der Computer darf in dieser Version anfangen viel Spass beim versuch in zu schlagen"

while true; do
    #PC
    if [[ $spielstand -eq 0 ]]; then
        spielstand=2
    elif [[ 0 -eq $(($spielstand%3)) ]]; then
        spielstand=$((spielstand+2))
    else
        spielstand=$((spielstand+1))
    fi
    echo "PC zug: " $spielstand
    #mal schauen ne
    if [[ $spielstand -eq 20 ]]; then
        echo "guter versuch aber ned gut genug wa"
        exit 0
    fi

    versuch=$spielstand

    #player
    while true; do
    read -p "Ihr versuch: " versuch
    if [[ $versuch -gt 20 ]]; then
        echo "Junge 20 gewinnt ned 21 oder was anderes?"
    elif [[ $versuch -eq $((spielstand+1)) ]] || [[ $versuch -eq $((spielstand+2)) ]]; then
        break
    else
        echo "des ist ned gültig Juuunge"
    fi
    done
    #mal schauen ne
    spielstand=$versuch
    if [[ $spielstand -eq 20 ]]; then
        echo "Ich denke das ist ned erlaubt du hast aber gewonnen"
        exit 1
    fi
done