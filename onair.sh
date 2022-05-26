#!/bin/bash

signOn=0

while true
do
  parent_path=$(dirname "${BASH_SOURCE[0]}")
  isMeetOpen=$(osascript $parent_path/isMeetOpen.scpt)
  zoomCount=$(ps aux | grep -c zoom)

  if [[ $isMeetOpen -eq 1 || $zoomCount -gt 3 ]]; then
    if [[ $signOn -eq 0 ]]; then
      signOn=1
      curl --location --request POST 'http://192.168.87.21:8081/zeroconf/switch' \
        --header 'Content-Type: application/json' \
        --data-raw '{
            "sequence": "",
            "encrypt": "false",
            "selfApikey": "",
            "deviceid": "10013c757a",
            "data": {
                "switch": "on"
            }
        }'
      fi
  elif [[ $signOn -eq 1 ]]; then
    signOn=0
    curl --location --request POST 'http://192.168.87.21:8081/zeroconf/switch' \
      --header 'Content-Type: application/json' \
      --data-raw '{
          "sequence": "",
          "encrypt": "false",
          "selfApikey": "",
          "deviceid": "10013c757a",
          "data": {
              "switch": "off"
          }
      }'
  fi 
  sleep 10
done