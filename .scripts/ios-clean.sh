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

prompt() {
    read -p "CLEANING LOCAL PODS. ARE YOU SURE? (Y/N) " ANSWER

    shopt -s nocasematch
    if [[ "$ANSWER" =~ ^([Yy]|yes)$ ]]; then
        CONFIRMED=true
    else
        CONFIRMED=false
    fi
}
prompt

ios_clean() {
    if [[ $CONFIRMED = true ]]; then
        echo ""
        echo "EXECUTING FROM ($PROJECT_PATH)"

        rm -rf "$PROJECT_PATH/ios/Pods" && echo "REMOVED PODS ($PROJECT_PATH/ios/Pods)"
        rm -rf "$PROJECT_PATH/ios/Podfile.lock" && echo "REMOVED PODFILE LOCK FILE ($PROJECT_PATH/ios/Podfile.lock)"

        cd "$PROJECT_PATH/ios"
        xcodebuild clean

        echo ""
        echo "LOCAL PODS CLEANED. DO POD INSTALL ✅"
    else
        echo ""
        echo "OPERATION CANCELLED"
    fi
}
ios_clean
