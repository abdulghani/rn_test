#!/bin/bash

if [[ ! "$(which watchman)" ]]; then
    brew install watchman
fi

if [[ ! "$(which pod)" ]]; then
    brew install cocoapods
fi
