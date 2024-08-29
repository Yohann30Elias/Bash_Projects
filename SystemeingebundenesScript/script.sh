#!/bin/bash

log_message() {
    PARAM=$1
    MESSAGE="Logger Event - $PARAM"
    logger "$MESSAGE"
    echo "Logged message: $MESSAGE"
}

log_message "Systemstart"

trap 'log_message "Shellstart"' DEBUG

watch_file="/etc/passwd"
log_message "Warte auf Änderungen in $watch_file..."
inotifywait -q -m -e modify "$watch_file" | while read -r event; do
    log_message "Dateiänderung ($watch_file)"
done &

log_message "Warte auf Zeitpunkt in 5 Minuten..."
sleep 300 && log_message "Zeitpunkt in 5 Minuten" &

log_message "Warte auf Betriebszeitpunkt (jede 2. Minute)..."
while true; do
    log_message "Betriebszeitpunkt ($(date +'%H:%M'))"
    sleep 120
done &

log_message "Warte auf Mitte der Pause in 10 Minuten..."
sleep 600 && log_message "Mitte der Pause" &

wait

echo "Alle Log-Einträge wurden erstellt."
