#!/system/bin/sh

#######	wol.sh v1.0 (05.05.2012) by Shumaher
#######	http://blog.shumaher.net.ru/wake-on-lan-v-android-bez-dopolnitelnyh-prilozhenij/
################################################################

SCRIPTVER='wol.sh v1.0 (05.05.2012) by Shumaher'

PATH=$ANDROID_DATA/data/berserker.android.apps.sshdroid/home/bin:$PATH

echo $SCRIPTVER
echo
echo

case $1 in

	"c")
MAC="00:11:22:33:44:55"
COMP="comp"
	;;

	*)
echo "No comp named $1!"
exit 0
	;;

esac

if [ $2 -gt 1 -a $2 -eq $2 ]
then
COUNT="$2"
MSG="$COUNT WakeOnLan packets sent to $COMP!"
else
COUNT="1"
MSG="WakeOnLan packet sent to $COMP!"
fi

i=0
while [ $i -lt $COUNT ]
do
ether-wake -b $MAC
echo "+"
i=$(i=i + 1)
done

echo $MSG
echo
echo
echo
echo
echo
echo
