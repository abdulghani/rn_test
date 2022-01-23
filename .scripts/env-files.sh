#!/bin/bash

PROJECT_PATH="$(pwd | sed -e 's/\/ios$//i')"

# FIREBASE GOOGLE SERVICES JSON
if [[ -f "$PROJECT_PATH/env/google-services.json" ]]; then
    cp "$PROJECT_PATH/env/google-services.json" "$PROJECT_PATH/android/app/google-services.json"
fi
