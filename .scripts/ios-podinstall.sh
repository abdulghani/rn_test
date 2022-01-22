#!/bin/bash

PROJECT_PATH="$(pwd)"

pod_install() {
    echo "EXECUTING FROM ($PROJECT_PATH)"

    cd "$PROJECT_PATH/ios"
    pod install
}
pod_install
