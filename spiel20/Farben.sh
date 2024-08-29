#!/bin/bash
# 2024 Yohann Riond
# 20 gewinnt Spiel für den Herr Vogel
# Thymio will des hier unbedingt aber hat keine Parameter

spielstand=0

# Farbenspass heheh
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # Nix farbe hier

# Blinking tut tut
blink=$(tput blink)
reset=$(tput sgr0)

echo -e "${GREEN}Willkommen bei 20 Gewinnt. Sie dürfen Anfangen. (Wehe sie kennen das spiel ned)${NC}"

# Spiel-Loop
while true; do
    # Spieler-Input
    while true; do
        read -p "$(echo -e ${BLUE}"Ihr Versuch: "${NC})" versuch
        if [[ $versuch -gt 20 ]]; then
            echo -e "${RED}Das ist mehr als erlaubt${NC}"
        elif [[ $versuch -eq $((spielstand+1)) ]] || [[ $versuch -eq $((spielstand+2)) ]]; then
            break
        else
            echo -e "${YELLOW}Das ist nicht gültig${NC}"
        fi
    done

    # Spielstand aktualisieren
    spielstand=$versuch
    echo -e "${YELLOW}Aktueller Spielstand: $spielstand${NC}"
    if [[ $spielstand -eq 20 ]]; then
        echo -e "${GREEN}${blink}Wow, du hast gewonnen!${reset}${NC}"
        exit 0
    fi
    
    # PC-Zug
    if [[ $spielstand -gt 17 ]]; then
        spielstand=20
    else
        spielstand=$((spielstand + RANDOM % 2 + 1))
    fi

    echo -e "${YELLOW}Spielstand nach dem PC-Zug: $spielstand${NC}"
    if [[ $spielstand -eq 20 ]]; then
        echo -e "${RED}${blink}Der Computer hat gewonnen!${reset}${NC}"
        exit 0
    fi
done
