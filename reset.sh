#!/bin/bash

SCRIPT_DIR="$(dirname -- $(readlink -f -- $BASH_SOURCE))"

test -f  $SCRIPT_DIR/env.sh && source $SCRIPT_DIR/env.sh

killall vault
echo "waiting for Vault to restart"
sleep 3
rm -f configurations/*/*.tfstate{,.backup} configurations/*/state/*.tfstate{,.backup}
./apply.sh admin
