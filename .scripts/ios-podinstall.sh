#!/bin/bash

PROJECT_PATH="$(pwd | sed -e 's/\/ios$//i')"

pod_install() {
    echo ""
    echo "EXECUTING FROM ($PROJECT_PATH)"

    cd "$PROJECT_PATH/ios"
    pod install
}
pod_install
