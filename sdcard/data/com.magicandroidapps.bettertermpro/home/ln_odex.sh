#!/system/bin/sh

PATH=$ANDROID_ROOT/xbin:$PATH 

find /data/app -type f -name "*.odex" -exec mv {} /data/sdext2/ \;
find /data/sdext2 -type f -name "*.odex" -exec ln -s {} /data/app/ \;



# ln -s ../../../../mnt/sdcard/Android/data/com.promt.pmtappsale/files/pbaudio /data/data/com.promt.pmtappsale/files/
