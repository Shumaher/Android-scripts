#!/system/bin/sh

# reverse-tethering.sh v1.0 (17.10.2015) by Shumaher
# http://blog.shumaher.net.ru/android-reverse-tethering
##########################

SCRIPTVER='reverse-tethering.sh v1.0 (17.10.2015) by Shumaher'

PATH=$ANDROID_ROOT/xbin:$PATH

echo $SCRIPTVER
echo
echo

if [ -e /sys/class/net/rndis0 ]
then
	IFACE='rndis0' && \
	echo "Interface is rndis0"
elif [ -e /sys/class/net/usb0 ]
then
	IFACE='usb0' && \
	echo "Interface is usb0"
else
	echo "No USB-modem interfaces found! Exit..."
	exit 0
fi

ifconfig rmnet0 down
ifconfig $IFACE 192.168.42.2 netmask 255.255.255.0 up
route add default gw 192.168.42.1 dev $IFACE
setprop net.dns1 8.8.8.8
setprop net.dns2 8.8.4.4

echo
echo
echo
echo
echo
echo
