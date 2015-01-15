#!/system/bin/sh

# cifs.sh v3.1 (05.07.2013) by Shumaher
# http://blog.shumaher.net.ru/android-cifs2
##########################

SCRIPTVER='cifs.sh v3.1 (05.07.2013) by Shumaher'

PATH=$ANDROID_ROOT/xbin:$PATH
DIRBASE="$EXTERNAL_STORAGE/cifs"
USER="$1"
PASS="$2"
SERV="$3"
SERVNAME="$4"
SHARE="$5"

echo $SCRIPTVER
echo
echo

cdmodules()
{
if [ -e $ANDROID_ROOT/lib/modules/cifs.ko ]
then
	cd $ANDROID_ROOT/lib/modules
elif [ -e $DIRBASE/modules/$(uname -r)/cifs.ko ]
then
	cd $DIRBASE/modules/$(uname -r)
else
	echo "cifs.ko not found in $ANDROID_ROOT/lib/modules or $DIRBASE/modules/$(uname -r)"
	echo
	echo "See http://blog.shumaher.net.ru/android-cifs for info how to compile required modules,"
	echo "and http://blog.shumaher.net.ru/android-cifs2 for manual about this script and its newer versions!"
	echo
	echo
	echo
	echo
	echo
	echo
	exit 0
fi
}

loadmodules()
{
if ! lsmod | grep -q "slow_work"
then
	if [ -e ./slow-work.ko ]
	then
		insmod ./slow-work.ko && \
		echo "slow-work.ko loaded!"
	else
		echo "slow-work.ko not found!  (if cifs.ko will load below, it's okay)"
	fi
else
	echo "slow-work.ko already loaded!"
fi

if ! lsmod | grep -q "md4"
then
	if [ -e ./md4.ko ]
	then
		insmod ./md4.ko && \
		echo "md4.ko loaded!"
	else
		echo "md4.ko not found!  (if cifs.ko will load below, it's okay)"
	fi
else
	echo "slow-work.ko already loaded!"
fi

if ! lsmod | grep -q "nls_utf8"
then
	insmod ./nls_utf8.ko && \
	echo "nls_utf8.ko loaded!"
else
	echo "nls_utf8.ko already loaded!"
fi

if ! lsmod | grep -q "cifs"
then
	insmod ./cifs.ko && \
	echo "cifs.ko loaded!"
else
	echo "cifs.ko already loaded!"
fi
}

mounting()
{
USER="$1"
PASS="$2"
SERV="$3"
SERVNAME="$4"
SHARE="$5"
if [ $# == 4 ]
then
	SERVNAME="$3"
	SHARE="$4"
fi
DIR="$DIRBASE/$SERVNAME/$SHARE"
SHAREPATH="//$SERV/$SHARE"
PATTERN="unc=\\\\$SERV\\$SHARE,username=$USER"

if [ $USER == "smb" ]							# пользователь для монтирования в read-only
then
	RW="ro"
else
	RW="rw"
fi

if mount | grep -Fq "$PATTERN"
then
	echo "UnMounting $SHAREPATH ..."
	umount -f -l $DIR && \
	echo "$SHAREPATH unmounted by $USER!"
else
	cdmodules && \
	loadmodules && \
	if [ ! -d $DIR ]
	then
		mkdir -p $DIR && \
		echo "Created mount point $DIR"
	fi
	echo "Mounting $SHAREPATH to $DIR ..."
	mount -t cifs -o $RW,iocharset=utf8,username=$USER,password=$PASS,file_mode=0777,dir_mode=0777 $SHAREPATH $DIR && \
	echo "$SHAREPATH mounted by $USER!"
fi
}

if [ $# == 1  ]
then
	case $1 in
	"d")										# данные для подключения к серверу, блок начиная с этой строки до ;; можно копировать, меняя аргумент "ShareShortcut" - кроме букв "i", "l", "m", "r"!
mounting user password 192.168.1.1 comp share	# Пользователь Пароль IPСервера [ИмяСервера] Шара
	;;											# копировать до этой строки включительно
	
	"i")
cdmodules && \
loadmodules
	;;
 
	"l")
lsmod
	;;
	
	"m")
if mount | grep -q "type cifs"
then 
	mount | grep "type cifs"
else
	echo "No mounted shares found!"
fi
	;;

	"r")
if lsmod | grep -q "nls_utf8"
then
	rmmod nls_utf8 && \
	echo "nls_utf8.ko unloaded!"
else
	echo "nls_utf8.ko wasn't load!"
fi

if lsmod | grep -q "md4"
then
	rmmod md4 && \
	echo "md4.ko unloaded!"
else
	echo "md4.ko wasn't load!"
fi

if lsmod | grep -q "cifs"
then
	rmmod cifs && \
	echo "cifs.ko unloaded!"
else
	echo "cifs.ko wasn't load!"
fi

if lsmod | grep -q "slow_work.*permanent"
then
	echo "slow-work.ko loaded permanently!"
elif lsmod | grep -Fq "slow_work" | grep -Fqv "permanent"
then
	rmmod slow-work && \
	echo "slow-work.ko unloaded!"
else
	echo "slow-work.ko wasn't load!"
fi
	;;

	*)
echo "Invalid argument."
echo "Type '`basename $0` User Password ServerIP [ServerName] Share' to mount share,"
echo "or   '`basename $0`' for help."
	;;
	esac
elif [ $# == 4 ]
then
	SERVNAME="$3"
	SHARE="$4"
	mounting $USER $PASS $SERV $SERVNAME $SHARE
elif [ $# == 5 ]
then
	mounting $USER $PASS $SERV $SERVNAME $SHARE
else
	echo "Command line options:"
	echo " i                                         Insert (load) cifs.ko"
	echo " l                                         List Loaded modules"
	echo " m                                         List Mounted shares"
	echo " r                                         Remove (unload) cifs.ko"
	echo " ShareShortcut                             Mount share defined as ShareShortcut (see source)"
	echo " User Password ServerIP [ServerName] Share Mount share with given details"
	echo "                                           This help"
	echo
	echo "See http://blog.shumaher.net.ru/android-cifs for manual how to compile required modules,"
	echo "and http://blog.shumaher.net.ru/android-cifs2 about this script and its newer versions!"
fi

echo
echo
echo
echo
echo
echo
