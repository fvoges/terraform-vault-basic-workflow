#!/bin/bash

if [ -z "$1" ]
then
  PREFIX=""
else
  PREFIX="$1/"
fi

vault list -format json "${PREFIX}identity/entity/name"|python3 -c 'import json,sys;[print(obj) for obj in json.load(sys.stdin) ]' | while read name
# vault list -format json "${PREFIX}identity/entity/name"|jq -r .[] | while read name
do
  echo -n "$name: "
  vault read -format json "${PREFIX}identity/entity/name/${name}"|python3 -c 'import json,sys;obj=json.load(sys.stdin);print(obj["data"]["id"])'
  # vault read -format json "${PREFIX}identity/entity/name/${name}"|jq -r .data.id
done
