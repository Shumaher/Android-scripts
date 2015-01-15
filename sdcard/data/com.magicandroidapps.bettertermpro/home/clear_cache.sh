#!/system/bin/sh

#######	clear_cache.sh v1.0 (05.05.2012) by Shumaher
#######	http://blog.shumaher.net.ru/kak-montirovat-setevye-diski-windows-v-android-bez-konsoli/
################################################################

SCRIPTVER='clear_cache.sh v1.0 (13.05.2012) by Shumaher'

export PATH=/data/data/berserker.android.apps.sshdroid/home/bin:$PATH

echo $SCRIPTVER
echo
echo

cd /cache/

if [ -f Download*.apk ]
then
find /cache -name "Download*.apk" -exec echo {} deleted! \;
rm -fv ./Download*.apk
else
echo "/cache/Download*.apk not found!"
fi

echo
echo
echo
echo
echo
echo
