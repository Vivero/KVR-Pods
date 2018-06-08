#!/usr/bin/bash

# make a release folder
RELEASE_DIR="./release"
mkdir -p $RELEASE_DIR

# delete release folder contents
rm -rf $RELEASE_DIR/*

# copy assets
GAMEDATA_ASSETS=(
    'Patches'
    'Spaces'
)

GAMEDATA_DIR="$RELEASE_DIR/GameData"
mkdir -p $GAMEDATA_DIR
for asset in "${GAMEDATA_ASSETS[@]}"; do
    cp -pr $asset $GAMEDATA_DIR/.
done

# copy release files
RELEASE_ASSETS=(
    'LICENSE'
    'README.md'
)

for asset in "${RELEASE_ASSETS[@]}"; do
    cp -pr $asset $RELEASE_DIR/.
done

# create zip file
ZIP_FILENAME="KVR-Pods.zip"
cd $RELEASE_DIR
zip -r $ZIP_FILENAME *
