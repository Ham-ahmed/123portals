#!/bin/sh

echo "> downloading & installing portals files  Please Wait ..."
sleep 3

wget --show-progress -qO /etc/enigma2/MultiStalkerPro.json "https://raw.githubusercontent.com/Ham-ahmed/123portals/refs/heads/main/MultiStalkerPro.json"
download=$?
echo ''
if [ $download -eq 0 ]; then
echo "> installation of portals files  finished"
sleep 3

echo "> Setup the plugin..."
# Configure MultiStalkerPro_settings
touch "temp_dir/temp_file"
cat <<EOF > "temp_dir/temp_file"
config.plugins.MultiStalkerPro.adult=True
config.plugins.MultiStalkerPro.color=Red
config.plugins.MultiStalkerPro.extplayer_subtitle_font_color=#00ffff00
config.plugins.MultiStalkerPro.extplayer_subtitle_pos=86
config.plugins.MultiStalkerPro.host=http://dreamtv22.info:25461/
config.plugins.MultiStalkerPro.username=270297167590
config.plugins.MultiStalkerPro.password=244492432922
config.plugins.MultiStalkerPro.mainmenu=True
config.plugins.MultiStalkerPro.portalNB=43
config.plugins.MultiStalkerPro.PvrServiceType=5002
config.plugins.MultiStalkerPro.subDL=AR
config.plugins.MultiStalkerPro.tmdb_key=462c2e610e5c68bcb98b51fd5c5b09c6
config.plugins.MultiStalkerPro.tmdbL=ar-AR
EOF

# Update Enigma2 settings
sed -i "/MultiStalkerPro/d" /etc/enigma2/settings
grep "config.plugins.MultiStalkerPro.*" "temp_dir/temp_file" >> /etc/enigma2/settings
rm -rf "temp_dir/temp_file" >/dev/null 2>&1

sleep 2
echo "> Setup done..., Please wait enigma2 restarting..."
sleep 1
echo "> Uploaded 30-11-2024"

sleep 2
echo ""
echo "" 
echo "**********************************************************
echo "#                   INSTALLED SUCCESSFULLY              #"
echo "*                       ON - Panel                      *"
echo "*                Enigma2 restart is required            *"
echo "**********************************************************"
echo "               UPLOADED BY  >>>>   HAMDY_AHMED           "
sleep 4;
	echo '======================================================'
############################################                                                                                                                  
echo ". >>>>         RESTARING         <<<<"
echo "**********************************************************"
wait
else
    sleep 2
    # Restart Enigma2 service or kill enigma2 based on the system
if [ -f /etc/apt/apt.conf ]; then
    killall -9 enigma2
    sleep 2;
fi
sleep 3
fi