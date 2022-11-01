#!/bin/bash -e

SCRIPT_DIR="$(dirname -- $(readlink -f -- $BASH_SOURCE))"

test -f  $SCRIPT_DIR/env.sh && source $SCRIPT_DIR/env.sh

find configurations/terraform-vault-ns -type f -name *.tfvars | sort | while read line
do
  v="${line/*-ns\//}"
  echo "================================================================================"
  echo applying: ${line}
  echo
  ./apply.sh ns ${v/.tfvars/}
  echo
done

find configurations/terraform-vault-app_ns -type f -name *.tfvars | sort | while read line
do
  v="${line/*-app_ns\//}"
  echo "================================================================================"
  echo applying: ${line}
  echo
  ./apply.sh app_ns ${v/.tfvars/}
  echo
done

find configurations/terraform-vault-app -type f -name *.tfvars | sort | while read line
do
  v="${line/*-app\//}"
  echo "================================================================================"
  echo applying: ${line}
  echo
  ./apply.sh app ${v/.tfvars/}
  echo
done
