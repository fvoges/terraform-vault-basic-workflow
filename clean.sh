#!/bin/bash

killall vault
rm -f configurations/*/*.tfstate{,.backup} configurations/*/state/*.tfstate{,.backup} tf.log
rm -rf */*/.terraform{,.lock.hcl}
