#!/bin/bash

export VAULT_LOG_LEVEL=debug

while true;
do
  # vault server -dev -dev-root-token-id root -config ./tls/vault_tls.hcl
  vault server -dev -dev-root-token-id root -dev-tls -dev-tls-cert-dir=tls
  # Wait to allow to Ctrl-C out of the loop
  sleep 1
done

