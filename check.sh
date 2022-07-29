#!/bin/bash -e

find configurations -type d  -iname "terraform-vault-*" |while read conf_dir
do
  cd $conf_dir
  echo "terraform validate: ${conf_dir}"
  # terraform init
  terraform validate
  cd -
  echo
done

echo "terraform format:"
terraform fmt -recursive
echo

echo "terraform docs:"
find configurations modules -type d  -iname "terraform-vault-*" |while read dir
do
  echo "terraform docs: ${dir}"
  # terraform init
  terraform-docs $dir
  echo
done
