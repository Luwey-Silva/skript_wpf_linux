#!/bin/bash

# Ersetzen Sie diese Variablen mit Ihren persönlichen Daten
KLASSENNAME="FS-B-13"
MEIN_NAME="Da Silva" # Ihren Nachnamen hier einsetzen
USER_NAME="user" # Ihren Benutzernamen hier einsetzen

# Systeminformationen sammeln
FQDN=$(hostname --fqdn)
IP_ADDRESS=$(hostname -I | awk '{print $1}')
NETMASK=$(ip addr show | grep -w inet | awk '{print $2}' | cut -d/ -f2 | head -n 1)
GATEWAY=$(ip route | grep default | awk '{print $3}')
DNS=$(cat /etc/resolv.conf | grep 'nameserver' | awk '{print $2}')
MAC_ADDRESS=$(ip link show | grep link/ether | awk '{print $2}' | head -n 1)
USER_UID=$(id -u $USER_NAME)
USER_GID=$(id -g $USER_NAME)
DISK_USAGE=$(df -h)

# Datum
DATE=$(date "+%d.%m.%Y")

# Dateiname für das Datenblatt
DATENBLATT_NAME="Server-Datenblatt-${KLASSENNAME}-${MEIN_NAME}.txt"

# Daten in das Datenblatt schreiben
{
    echo "$KLASSENNAME                       $MEIN_NAME                       $DATE"
    echo ""
    echo ""
    echo ""
    echo ""
    echo ""
    echo "                                 Server-Datenblatt"
    echo "                                 ================="
    echo ""
    echo ""
    echo ""
    echo ""
    echo ""
    echo "Netzwerk"
    echo "--------"
    echo ""
    echo ""
    echo "FQDN:                             $FQDN"
    echo "IP / Netmask:                     $IP_ADDRESS / $NETMASK"
    echo "Gateway:                          $GATEWAY"
    echo "DNS:                              $DNS"
    echo "MAC-Adresse:                      $MAC_ADDRESS"
    echo ""
    echo "Benutzer"
    echo "--------"
    echo ""
    echo ""
    echo "User-Name:                        $USER_NAME"
    echo "UID:                              $USER_UID"
    echo "GID:                              $USER_GID"
    echo ""
    echo "Festplatte(n)"
    echo "-------------"
    echo ""
    echo ""
    echo "Belegung:"
    echo "$DISK_USAGE"
    echo ""
    echo "Diese Info wurde von $MEIN_NAME am $DATE erstellt."
    echo ""
    echo ""
    echo ""
    echo ""
    echo ""
} > "$DATENBLATT_NAME"

