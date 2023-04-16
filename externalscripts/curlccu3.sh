#!/bin/bash
curl -s -k "https://$1/addons/xmlapi/state.cgi?device_id=$2"
