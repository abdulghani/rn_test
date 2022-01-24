#!/bin/bash

PROJECT_PATH="$(pwd | sed -e 's/\/ios$//i')"

check_platform() {
    PLATFORM="$(uname -s | sed y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/)"
    if [[ ! $PLATFORM = "darwin" ]]; then
        echo "PLATFORM IS NOT MACOS ($PLATFORM)"
        exit 0
    fi
}
check_platform

xcode-select --install
brew install ruby
brew install fastlane
