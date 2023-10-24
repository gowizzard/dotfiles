#!/bin/bash

# Initialisierung für das i3bar-Protokoll
echo '{"version":1}'
echo '['
echo '[]'

get_cpu_usage() {
    read cpu a b c previdle rest < /proc/stat
    prevtotal=$((a+b+c+previdle))
    sleep 0.1
    read cpu a b c idle rest < /proc/stat
    total=$((a+b+c+idle))
    cpu_usage=$((100*( (total-prevtotal) - (idle-previdle) ) / (total-prevtotal) ))
    echo $cpu_usage
}

get_battery_status() {
    batteryPath="/sys/class/power_supply/BAT0/"
    
    # Überprüfen, ob das Batterie-Verzeichnis existiert
    if [[ -d $batteryPath ]]; then
        status=$(cat "${batteryPath}status")
        capacity=$(cat "${batteryPath}capacity")
        echo "$status $capacity%"
    else
        echo "Keine Batterie gefunden"
    fi
}

# Endlose Schleife, um Daten ständig zu aktualisieren
while :; do

    # Batteriestatus holen
    BATTERY=$(get_battery_status)

    # CPU-Auslastung holen
    CPU=$(get_cpu_usage)

    # RAM-Verbrauch holen (genutzt / gesamt)
    RAM_USED=$(free -m | awk 'NR==2{print $3}')
    RAM_TOTAL=$(free -m | awk 'NR==2{print $2}')

    # Aktuelle Zeit holen
    DATE=$(date '+%Y-%m-%d %H:%M:%S')

    # Daten für i3bar formatieren
    echo ",[{\"full_text\":\"$BATTERY\"},{\"full_text\":\" CPU: $CPU%\"},{\"full_text\":\" RAM: $RAM_USED/$RAM_TOTAL MB\"},{\"full_text\":\" $DATE\"}]"

done
