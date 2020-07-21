#!/bin/bash
set -e #exit on error
set -o pipefail
#set -x #uncomment for development
DEBUG=""
if [[ "$1" == "DEBUG" ]]
then
  DEBUG="echo"
fi

ROUTER=${ROUTER:-http://192.168.8.1}

DATA=$(curl $ROUTER/api/monitoring/traffic-statistics --silent \
  | perl -ne '
  while(/<(.*?)>([0-9]*)<\/\1>/g){
    push @items,"$1=$2";
  }
  END{
    print join(",",@items);
  }')

$DEBUG curl -i -XPOST 'http://localhost:8086/write?db=rpi0' \
  --data-binary "router $DATA"
