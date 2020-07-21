#!/bin/bash
set -e #exit on error
set -o pipefail

ROUTER=${ROUTER:-http://192.168.8.1}

DATA=$(curl $ROUTER/api/monitoring/traffic-statistics --silent \
  | perl -ne '
  while(/<(.*?)>([0-9]*)<\/\1>/g){
    push @items,"$1=$2";
  }
  END{
    print join(",",@items);
  }')

echo "router $DATA"
