#!/bin/bash
# 2024 Yohann Riond
# Zahlen raten Aufgabe fürn Herr Vogel

spielzahl=$[RANDOM%20]
versuche=1

echo "versuchen sie die Zahl vong 1-20 zu erraten"

while true; do

    read -p "Ihr versuch: " versuch
    if [[ versuch -gt 20 ]]; then
        echo "Juuunge das ist über 20"
    elif [[ versuch -eq $spielzahl ]]; then
        echo "Sie haben richtig geraten stark!!!"
        echo $versuche
        exit 1
    elif [[ versuch -gt $spielzahl ]]; then
        echo "Ihre eingegebene Zahl ist zu gross"
    elif [[ versuch -lt $spielzahl ]]; then
        echo "Ihr eingegebene Zahl ist zu klein"
    else
        echo "das sollte garned passieren"
        break
    fi
    versuche=$(($versuche+1))
done