#!/system/bin/sh

PATH=$ANDROID_ROOT/xbin:$PATH 


case $1 in

	"all")
$0 l
$0 mc
$0 vi
$0 vk
$0 pa
$0 pr
	;;

	"l")
rm -f /data/data/com.forpda.lp/files/busybox
ln -sf /data/sdext2/bin/busybox /data/data/com.forpda.lp/files/
	;;

	"mc")
cp -f /data/data/com.glebzakaev.mobilecarriers/databases/mobilecarriers /data/sdext2/data/com.glebzakaev.mobilecarriers/databases/
ln -sf /data/sdext2/data/com.glebzakaev.mobilecarriers/databases/mobilecarriers /data/data/com.glebzakaev.mobilecarriers/databases/
	;;

	"vi")
mkdir -p /data/sdext2/data/com.viber.voip/app_optimized/DexLib.apk
cp -f /data/data/com.viber.voip/app_optimized/DexLib.apk/DexLib.dex /data/sdext2/data/com.viber.voip/app_optimized/DexLib.apk/
ln -sf /data/sdext2/data/com.viber.voip/app_optimized/DexLib.apk/DexLib.dex /data/data/com.viber.voip/app_optimized/DexLib.apk/
mkdir -p /data/sdext2/data/com.viber.voip/app_working
cp -f /data/data/com.viber.voip/app_working/DexLib.apk /data/sdext2/data/com.viber.voip/app_working/
ln -sf /data/sdext2/data/com.viber.voip/app_working/DexLib.apk /data/data/com.viber.voip/app_working/
	;;

	"vk")
mv /data/data/com.vkontakte.android/files/stickers /data/sdext2/data/com.vkontakte.android/files/
ln -sf /data/sdext2/data/com.vkontakte.android/files/stickers /data/data/com.vkontakte.android/files/
	;;
	
	"pa")
find /data/data/com.maxmpz.audioplayer -type f -name "*.so" -exec cp -f {} /data/sdext2/data/com.maxmpz.audioplayer/files/ \;
find /data/sdext2/data/com.maxmpz.audioplayer/files -type f -name "*.so" -exec ln -sf {} /data/data/com.maxmpz.audioplayer/files/ \;
	;;
	
	"pr")
mkdir -p /mnt/sdcard/Android/data/com.promt.pmtappsale/files
cp -Rf /data/data/com.promt.pmtappsale/files/pbaudio/ /mnt/sdcard/Android/data/com.promt.pmtappsale/files/
ln -sf /mnt/sdcard/Android/data/com.promt.pmtappsale/files/pbaudio /data/data/com.promt.pmtappsale/files/
	;;

	*)
echo "Options:"
echo " all - ALL"
echo " l   - Lucky Patcher"
echo " mc  - Mobile carriers"
echo " vi  - Viber"
echo " vk  - Vkontakte"
echo " pa  - Poweramp"
echo " pr  - Promt Translate.Ru"

esac

echo
echo
echo
echo
echo


