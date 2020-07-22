#!/bin/bash
CURRENT_IP=`dig +short myip.opendns.com @resolver1.opendns.com`
LAST_IP=`cat ./freedns_last_ip`

TOTAL_KEYS=`jq -r '.total' ./config.json`
for (( c=0; c<$TOTAL_KEYS; c++ ))
do  
    KEY=`jq -r '.keys['$c']' ./config.json`
    if [ "$CURRENT_IP" != "$LAST_IP" ]; then
        echo $CURRENT_IP > ./freedns_last_ip
        
        wget --no-check-certificate -O - https://freedns.afraid.org/dynamic/update.php?$KEY >> ./freedns_updater.log
    fi
done
