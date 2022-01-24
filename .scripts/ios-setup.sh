#!/bin/bash

check_platform() {
    PLATFORM="$(uname -s | sed y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/)"
    if [[ ! $PLATFORM = "darwin" ]]; then
        echo "PLATFORM IS NOT MACOS ($PLATFORM)"
        exit 0
    fi
}
check_platform

if [[ ! "$(which ruby)" ]]; then
    brew install ruby
fi

if [[ ! "$(which watchman)" ]]; then
    brew install watchman
fi

if [[ ! "$(which pod)" ]]; then
    brew install cocoapods
fi

if [[ ! "$(which fastlane)" ]]; then
    brew install fastlane
fi
