#!/bin/bash

export TF_LOG_PATH="${PWD}/tf.log"
export TF_LOG="debug"
export TF_LOG_CORE="debug"
export TF_LOG_PROVIDER="trace"
export TERRAFORM_VAULT_LOG_BODY="true"

:> $TF_LOG_PATH

if [ $# -gt 0 ]
then
  cd "configurations/terraform-vault-$1"
  shift
fi

if [ $# -eq 1 ]
then
  config="$1"
  mkdir -p state
  terraform apply -auto-approve -state="state/${config}.tfstate" -var-file="${config}.tfvars"
else
  terraform apply -auto-approve "$@"
fi