#!/bin/bash

PROJECT_PATH="$(pwd)"

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

        PODS_PATH="$PROJECT_PATH/ios/Pods"
        rm -rf "$PODS_PATH" && echo "REMOVED PODS ($PODS_PATH)"

        PODFILELOCK_PATH="$PROJECT_PATH/ios/Podfile.lock"
        rm -rf "$PODFILELOCK_PATH" && echo "REMOVED PODFILE LOCK FILE ($PODFILELOCK_PATH)"

        pod cache clean 'RCT-Folly' --all && echo "REMOVED POD CACHE (RCT-Folly)"

        echo ""
        echo "LOCAL PODS CLEANED. DO POD INSTALL"
    else
        echo ""
        echo "OPERATION CANCELLED"
    fi
}
ios_clean
