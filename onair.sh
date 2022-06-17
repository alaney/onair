#!/bin/bash

sign_on=0
# Used to track the PID of the Automator process that launched this script.
automator_pid=$(( $(ps -ax | grep '[O]nAir' | awk '{print $1}') ))
parent_path=$(dirname "${BASH_SOURCE[0]}")

switch () {
  curl --location --request POST "http://192.168.87.21:8081/zeroconf/switch" \
    --header "Content-Type: application/json" \
    --data-raw "{
        \"deviceid\": \"\",
        \"data\": {
            \"switch\": \"$1\"
        }
    }"
}

while true
do
  # The -a option is used when this script is launched from Automator.
  if [[ "$1" = "-a" ]]; then
    resample_pid=$(( $(ps -ax | grep '[O]nAir' | awk '{print $1}') ))
    if (( $automator_pid != $resample_pid )); then 
      # If the PID changes this likely means the Automator process was stopped meaning
      # we should stop this script as well.  
      # Got the idea from https://discussions.apple.com/thread/8038454
      break
    fi
  fi
  
  # Apple script that checks Google Chrome for a Goole Meet tab
  is_meet_open=$(osascript $parent_path/isMeetOpen.scpt)
  # Looks like the number of Zoom processes increases to 4 when I'm in a Zoom meeting.
  zoom_count=$(ps aux | grep -c zoom)

  if [[ $is_meet_open -eq 1 || $zoom_count -gt 3 ]]; then
    if [[ $sign_on -eq 0 ]]; then
      sign_on=1
      switch "on"  
    fi
  elif [[ $sign_on -eq 1 ]]; then
    sign_on=0
    switch "off"
  fi 
  sleep 10
done
exit 0