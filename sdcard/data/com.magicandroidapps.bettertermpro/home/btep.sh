#!/system/bin/sh

export BTEP=/data/data/com.magicandroidapps.bettertermpro
export BTEPSD=/sdcard/data/com.magicandroidapps.bettertermpro
export SSHD=/data/data/berserker.android.apps.sshdroid
export SSHDSD=/sdcard/data/berserker.android.apps.sshdroid

cd $HOME

USERID=$(ls -la | $BTEP/bin/busybox grep ".*\..$" | $BTEP/bin/busybox awk '{print $3}')

case $1 in

	"b")
if mount | $BTEP/bin/busybox grep -q "/system.*ro"
then
mount -o remount,rw /system
fi
	
chmod 775 $BTEP/bin/*
chmod 775 $BTEP/data/xbin/*
	
ln -s $BTEP/bin/busybox /system/xbin/busybox && \
echo "/system/xbin/busybox link created!"

/system/xbin/busybox --install -s /system/xbin && \
echo "Links in /system/xbin/ to $BTEP/bin/busybox created!"

$BTEP/bin/busybox find ../bin/ -type l -exec rm -f {} \; && \
rm -f ../bin/busybox.exe && \
#rm -f ../bin/ether-wake && \
rm -f ../bin/dropbear* && \
#rm -f ../bin/scp && \
rm -f ../bin/sftp-server && \
rm -f $SSHD/dropbear/ssh && \
rm -f $SSHD/dropbear/scp && \
echo "$BTEP/bin/busybox.exe and links deleted!"

$BTEP/bin/busybox find $SSHD/home/bin/ -type l -exec rm -f {} \; && \
echo "Links in $SSHD/home/bin/ deleted!"

rm $SSHD/dropbear/busybox && \
ln -s $BTEP/bin/busybox $SSHD/dropbear/ && \
echo "Link to $SSHD/dropbear/busybox created!"

ln -s $BTEP/bin/ssh /system/xbin/ssh && \
ln -s $BTEP/bin/scp /system/xbin/scp && \
ln -s $SSHD/dropbear/sftp-server /system/xbin/sftp-server && \
echo "/system/xbin/ssh, scp & sftp-server links created!"
	;;

	"d")
if [ -d "../downloader" ]
then
rm -Rf ../downloader/
ln -s $BTEPSD/downloader ../downloader  && \
chown $USERID:$USERID ../downloader && \
chmod 777 ../downloader && \
echo "../downloader/ deleted!"
fi
	;;

	"n")
if [ ! -f "../bin/nano" ]
then
cp $BTEPSD/bin/nano ../bin/ && \
chown $USERID:$USERID ../bin/nano && \
chmod 777 ../bin/nano && \
#cp $BTEPSD/bin/htop ../bin/ && \
#chown $USERID:$USERID ../bin/htop && \
#chmod 777 ../bin/htop && \
echo "nano copied from SD!"
else
echo "../bin/nano exists!"
fi
	;;
	
	"s")
USERIDSSHD=$(ls -la $SSHD/home | $BTEP/bin/busybox grep ".*\..$" | $BTEP/bin/busybox awk '{print $3}')

cp $SSHDSD/home/.profile $SSHD/home/.profile && \
chown $USERIDSSHD:$USERIDSSHD $SSHD/home/.profile && \
chmod 775 $SSHD/home/.profile && \
echo "$SSHD/home/.profile copied from SD!"
	;;

	*)
#if [ -f ".profile" ]
#then
#mv .profile .profile_ORI && \
#echo ".profile file renamed to .profile_ORI!"
#fi

#if [ ! -f "local_profile" ]
#then
cp $BTEPSD/home/local_profile_HOME local_profile && \
echo "local_profile copied from SD!"
#fi
chown $USERID:$USERID local_profile
chmod 775 local_profile

if [ ! -e ".profile" ]
then
ln -s local_profile .profile && \
echo "local_profile link to .profile created!"
fi

if [ ! -d ".ssh" ]
then
rm -Rf .ssh
ln -s ../../../..$BTEPSD/home/.ssh && \
echo ".ssh link to SD created!"
else
echo "Directory/link .ssh exists!"
fi

rm -Rf Advent.z5
rm -f $SSHD/home/.ash_history

chown -R $USERID:$USERID *
chmod 777 ../

mkdir -p $BTEP/tmp/mc-0
chown 0:0 $BTEP/tmp/mc-0
	;;
	

esac
