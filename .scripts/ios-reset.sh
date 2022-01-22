#!/bin/bash

# THANKS lal
# https://stackoverflow.com/a/46428793/7280258

PROJECT_PATH="$(pwd)"

reset_pod() {
    echo "CLEANING SYSTEM PODS..." && echo ""

    cd "$PROJECT_PATH/ios"
    echo "EXECUTING FROM ($(pwd))" && echo ""

    pod cache clean --all
    rm -rf "$PROJECT_PATH/ios/Podfile.lock"

    rm -rf ~/Library/Caches/CocoaPods && echo "SUCCESSFULLY REMOVE (~/Library/Caches/CocoaPods)"
    rm -rf "$PROJECT_PATH/ios/Pods" && echo "SUCCESSFULLY REMOVE ($PROJECT_PATH/ios/Pods)"
    rm -rf ~/Library/Developer/Xcode/DerivedData && echo "SUCCESSFULLY REMOVE (~/Library/Developer/Xcode/DerivedData)"
    mkdir ~/Library/Developer/Xcode/DerivedData
    pod deintegrate
    pod setup
    pod install
}
reset_pod
