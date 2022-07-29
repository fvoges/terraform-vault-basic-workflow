#!/bin/bash

WORK_DIR="$(readlink -f "${BASH_SOURCE[0]}" | xargs -0 dirname)"

export NS="acme/suborg1/uat/uat-shared1"
export PREFIX="uat"
export GRP="cwc"
export APP="svc2"
export KEY="shared_key1"
export ROLE="${PREFIX}-${GRP}-${APP}"

export CERT_DIR="${WORK_DIR}/tls/simple-ca/certs"
export CLIENT_CRT="${CERT_DIR}/${ROLE}.crt"
export CLIENT_KEY="${CERT_DIR}/${ROLE}.key"

export VAULT_ADDR="https://localhost:9200/"
export VAULT_CACERT="${WORK_DIR}/tls/simple-ca/ca/ca.crt"

export VAULT_TOKEN="$(vault login -format=json -namespace=$NS -method=cert -client-cert=$CLIENT_CRT -client-key=$CLIENT_KEY name=$ROLE|jq -r '.["auth"]["client_token"]')"

VAULT_TOKEN="root" vault token lookup $VAULT_TOKEN
echo

# shared transit key
vault write -namespace="${NS}/${PREFIX}-${KEY}" "transit/encrypt/${PREFIX}-${KEY}" plaintext=$(base64 <<< "my secret data")

# app group transit key
# This command uses another way to access namespaces
vault write "${NS}/${PREFIX}-${GRP}/transit/encrypt/${ROLE}" plaintext=$(base64 <<< "my secret data")
