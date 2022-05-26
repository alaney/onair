#!/bin/bash

while true
do
  parent_path=$(dirname "${BASH_SOURCE[0]}")
  isMeetOpen=$(osascript $parent_path/isMeetOpen.scpt)
  zoomCount=$(ps aux | grep -c zoom)

  if [[ $isMeetOpen -eq 1 || $zoomCount -gt 3 ]]; then
    echo 1
  else
    echo 0
  fi 
  sleep 10
done