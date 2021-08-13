#!/bin/bash

# Just a basic script U can improvise lateron asper ur need xD 

MANIFEST="https://gitlab.com/OrangeFox/sync.git"
DEVICE=E6746
DT_LINK="https://github.com/mastersenpai05/twrp_micromax_e6746 -b orangefox-10.0"
DT_PATH=device/micromax/$DEVICE

echo " ===+++ Setting up Build Environment +++==="
apt install openssh-server -y
apt update --fix-missing
apt install openssh-server -y
mkdir ~/twrp && cd ~/twrp

echo " ===+++ Syncing Recovery Sources +++==="
git clone $MANIFEST fox
cd fox
./get_fox_10.sh ~/work
cd ~/work
git clone $DT_LINK $DT_PATH

echo " ===+++ Building Recovery +++==="
. build/envsetup.sh
export ALLOW_MISSING_DEPENDENCIES=true
export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER=1
export LC_ALL="C"
lunch omni_${DEVICE}-eng && mka recoveryimage

# Upload zips & recovery.img (U can improvise lateron adding telegram support etc etc)
echo " ===+++ Uploading Recovery +++==="
cd out/target/product/$DEVICE

#curl -T $OUTFILE https://oshi.at
curl -sL https://git.io/file-transfer | sh
./transfer wet *.zip
