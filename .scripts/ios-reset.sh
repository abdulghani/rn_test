#!/bin/bash

# THANKS lal
# https://stackoverflow.com/a/46428793/7280258

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
    read -p "CLEANING SYSTEM PODS. ARE YOU SURE? (Y/N) " ANSWER

    shopt -s nocasematch
    if [[ "$ANSWER" =~ ^([Yy]|yes)$ ]]; then
        CONFIRMED=true
    else
        CONFIRMED=false
    fi
}
prompt

reset_pod() {
    if [[ CONFIRMED = true ]]; then
        echo ""
        echo "CLEANING SYSTEM PODS..." && echo ""

        cd "$PROJECT_PATH/ios"
        echo "EXECUTING FROM ($(pwd))" && echo ""

        rm -rf "$PROJECT_PATH/ios/Podfile.lock"
        rm -rf "$PROJECT_PATH/ios/Pods" && echo "SUCCESSFULLY REMOVE ($PROJECT_PATH/ios/Pods)"
        xcodebuild clean

        pod cache clean --all

        rm -rf ~/Library/Caches/CocoaPods && echo "SUCCESSFULLY REMOVE (~/Library/Caches/CocoaPods)"
        rm -rf ~/Library/Developer/Xcode/DerivedData && echo "SUCCESSFULLY REMOVE (~/Library/Developer/Xcode/DerivedData)"
        mkdir ~/Library/Developer/Xcode/DerivedData

        pod deintegrate
        pod setup

        echo ""
        echo "LOCAL PODS CLEANED. DO POD INSTALL ✅"
    else
        echo ""
        echo "OPERATION CANCELLED"
    fi
}
reset_pod
