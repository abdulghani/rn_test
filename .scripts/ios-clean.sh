#!/bin/bash

PROJECT_PATH="$(pwd)"

ios_clean() {
    echo "EXECUTING FROM ($PROJECT_PATH)"

    PODS_PATH="$PROJECT_PATH/ios/Pods"
    rm -rf "$PODS_PATH" && echo "REMOVED PODS ($PODS_PATH)"

    PODFILELOCK_PATH="$PROJECT_PATH/ios/Podfile.lock"
    rm -rf "$PODFILELOCK_PATH" && echo "REMOVED PODFILE LOCK FILE ($PODFILELOCK_PATH)"

    pod cache clean 'RCT-Folly' --all && echo "REMOVED POD CACHE (RCT-Folly)"
}
ios_clean
