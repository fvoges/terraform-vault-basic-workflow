#!/bin/bash

killall vault
rm -f configurations/*/*.tfstate{,.backup} configurations/*/state/*.tfstate{,.backup}
./apply.sh admin
