#!/bin/bash
scriptloc=$(dirname "$(readlink -f "$0")")
raw=$(curl -s -k "https://$1/addons/xmlapi/devicelist.cgi" | "$scriptloc/xml-to-json.py")
readarray -t name < <(echo "$raw" | jq .deviceList.device | jq '.[]["@name"]')
readarray -t iseid < <(echo "$raw" | jq .deviceList.device | jq '.[]["@ise_id"]')
readarray -t devicetype < <(echo "$raw" | jq .deviceList.device | jq '.[]["@device_type"]')
printf "["
for i in "${!iseid[@]}"; do
  printf "{\"{#CCU3.ISEID}\":%s,\"{#CCU3.DEVICETYPE}\":%s,\"{#CCU3.NAME}\":%s}" "${iseid[i]}" "${devicetype[i]}" "${name[i]}"
  if [[ "${iseid[i+1]}" ]]; then
    printf ","
  fi
done
printf "]\n"
