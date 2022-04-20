#!/bin/bash
set -euo pipefail

export HUGO_VERSION="0.97.0"
wget https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz
tar -xzf hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz hugo && rm hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz
