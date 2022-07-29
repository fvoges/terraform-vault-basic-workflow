#!/bin/bash

export NS="acme/suborg1/uat/uat-shared1"
export PREFIX="uat"
export GRP="cwc"
export APP="svc3"
export KEY="shared_key1"

export ROLE="${PREFIX}-${GRP}-${APP}"

SECRET_ID="$(vault write -namespace="${NS}" -format=json -force auth/approle/role/"${ROLE}"/secret-id|jq -r '.["data"]["secret_id"]')"

export VAULT_TOKEN="$(vault write -namespace="$NS" -format=json auth/approle/login role_id="$ROLE" secret_id="$SECRET_ID"|jq -r '.["auth"]["client_token"]')"

VAULT_TOKEN="root" vault token lookup $VAULT_TOKEN
echo

# shared transit key
vault write -namespace="${NS}/${PREFIX}-${KEY}" "transit/encrypt/${PREFIX}-${KEY}" plaintext=$(base64 <<< "my secret data")

# app group transit key
# This command uses another way to access namespaces
vault write "${NS}/${PREFIX}-${GRP}/transit/encrypt/${ROLE}" plaintext=$(base64 <<< "my secret data")

