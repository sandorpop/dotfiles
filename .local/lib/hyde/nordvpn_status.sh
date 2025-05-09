#!/bin/bash

STATUS=$(nordvpn status)

if echo "$STATUS" | grep -q "Status: Connected"; then
    SERVER=$(echo "$STATUS" | awk -F': ' '/Server:/ {print $2}')
    CITY=$(echo "$STATUS" | awk -F': ' '/City:/ {print $2}')
    COUNTRY=$(echo "$STATUS" | awk -F': ' '/Country:/ {print $2}')
    IP=$(echo "$STATUS" | awk -F': ' '/^IP:/ {print $2}')
    TECH=$(echo "$STATUS" | awk -F': ' '/Current technology:/ {print $2}')
    
    TEXT=" $COUNTRY"
    TOOLTIP="Server: $SERVER\nCity: $CITY\nCountry: $COUNTRY\nIP: $IP\nTechnology: $TECH"
else
    TEXT="󰌿 Disconnected"
    TOOLTIP="Not connected to VPN"
fi

echo "{\"text\": \"$TEXT\", \"tooltip\": \"$TOOLTIP\"}"