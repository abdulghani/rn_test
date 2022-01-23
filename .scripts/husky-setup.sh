#!/bin/bash

HUSKY_DIR="$(pwd)/.husky"

if [[ ! -d "$HUSKY_DIR" ]]; then
    ./node_modules/.bin/husky install
else
    echo "HUSKY ALREADY SETUP ($HUSKY_DIR)"
fi
