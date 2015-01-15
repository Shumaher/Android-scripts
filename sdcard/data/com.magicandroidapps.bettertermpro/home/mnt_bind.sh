#!/system/bin/sh

# mnt_bind.sh v1.0 (01.01.2014) by Shumaher
# http://blog.shumaher.net.ru/android-bind
##########################

SCRIPTVER='mnt_bind.sh v1.0 (01.01.2014) by Shumaher'

PATH=$ANDROID_ROOT/xbin:$PATH
OBBEMU='/mnt/shell/emulated/obb'
OBBSD=$EXTERNAL_STORAGE/Android/obb
OBBSDEXT='/storage/sdcard1/Android/obb'

echo $SCRIPTVER
echo
echo

umount $OBBSD
mount -o bind $OBBSDEXT $OBBSD

mount
echo
echo
ls $OBBSD

echo
echo
echo
echo
echo
echo
