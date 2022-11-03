#!/bin/bash -e

find configurations modules -type f -iname "providers.tf" |while read providers_file
do
  conf_dir="$(dirname $providers_file)"
  echo $conf_dir
  cd $conf_dir
  terraform init "$@" > /dev/null
  echo
  cd -
done
