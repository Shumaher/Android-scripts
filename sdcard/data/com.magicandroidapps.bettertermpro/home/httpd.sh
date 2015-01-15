#!/system/bin/sh

# httpd.sh v1.1 (19.03.2014) by Shumaher
# http://blog.shumaher.net.ru/
##########################

SCRIPTVER='httpd.sh v1.1 (19.03.2014) by Shumaher'

PATH=$ANDROID_ROOT/xbin:$PATH

echo $SCRIPTVER
echo
echo

	case $1 in
	"b")
if [ -d /storage/sdcard1 ]
then
BACKUPDIR="/storage/sdcard1/data/Copies/Backup/appmonster2/backup"
else
BACKUPDIR="$EXTERNAL_STORAGE/data/Copies/Backup/appmonster2/backup"
fi

httpd -h $BACKUPDIR && \
echo "httpd started with docroot $BACKUPDIR"
	;;

	"r")
httpd -h / && \
echo "httpd started with docroot /"
	;;

	"s")
httpd -h $EXTERNAL_STORAGE && \
echo "httpd started with docroot $EXTERNAL_STORAGE"
	;;	
	
	"k")
killall httpd && \
echo "httpd killed!"
	;;
	
	*)
echo "Invalid argument."
echo "Type '`basename $0` b / r / s / k ,"
echo "or   '`basename $0`' for help."
	;;
	esac

echo
echo
echo
echo
echo
echo
echo
