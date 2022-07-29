#!/bin/bash -e

find configurations modules -type d  -iname "terraform-vault-*" |while read conf_dir
do
  cd $conf_dir
  echo $conf_dir
  terraform init
  echo
  cd -
done
