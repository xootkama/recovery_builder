#ANIFEST="https://github.com/minimal-manifest-twrp/platform_manifest_twrp_aosp.git"
#EVICE=star
#DT_LINK="https://github.com/mastersenpai05/device_xiaomi_star_twrp"
#T_PATH=device/xiaomi/$DEVICE

echo " ===+++ Setting up Build Environment +++==="
apt install openssh-server -y
apt update --fix-missing
apt install openssh-server -y
mkdir ~/twrp && cd ~/twrp

echo " ===+++ Syncing Recovery Sources +++==="
wget http://download939.mediafire.com/pqmvbjk59gkg/m81fk38cgxflau2/Infinix_Hot_10S_X689B_MT6768_V181_210326.zip
unzip -l *.zip
cd Infinix_Hot_10S_X689B_MT6768_V181_210326
ls

# Upload zips & recovery.img
echo " ===+++ Uploading Recovery +++==="
zip -r9 $OUTFILE ${OUTFILE%.zip}.img

#curl -T $OUTFILE https://oshi.at
curl -sL $OUTFILE https://git.io/file-transfer | sh
./transfer wet *.zip
