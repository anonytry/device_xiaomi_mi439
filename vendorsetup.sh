#!/bin/bash

echo ">>> Auto Sync: Checking device trees for mi439..."

ROOT=$(pwd)

clone_if_missing() {
	    REPO_PATH="$1"
    	    GIT_URL="$2"
	    BRANCH="$3"

    if [ ! -d "$REPO_PATH" ]; then
	        echo ">>> Cloning $REPO_PATH ..."

	if [ -z "$BRANCH" ]; then
               git clone --depth=1 "$GIT_URL" "$REPO_PATH"
        else
               git clone --depth=1 -b "$BRANCH" "$GIT_URL" "$REPO_PATH"
        fi
    else
        	echo ">>> $REPO_PATH already exists. Skipping."
    fi
}

# Device tree (common + device-specific)
clone_if_missing "$ROOT/device/xiaomi/sdm439-common" "https://github.com/anonytry/device_xiaomi_sdm439-common.git" 

clone_if_missing "$ROOT/device/xiaomi/mi439"         "https://github.com/anonytry/device_xiaomi_mi439.git"        

# Vendor tree
clone_if_missing "$ROOT/vendor/xiaomi/mi439"          "https://github.com/anonytry/vendor_xiaomi_mi439.git"          
clone_if_missing "$ROOT/vendor/xiaomi/sdm439-common"  "https://github.com/anonytry/vendor_xiaomi_sdm439-common.git" 

# Kernel tree (use your A11/LOS branch)
clone_if_missing "$ROOT/kernel/xiaomi/sdm439"         "https://github.com/anonytry/kernel_xiaomi_sdm439.git" "a11/lineageos"

echo ">>> Auto Clone Complete!"

