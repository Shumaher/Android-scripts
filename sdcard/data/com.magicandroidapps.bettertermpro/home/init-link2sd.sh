echo "$(date) mounting..." > $LOG
mount -t ext2 -o rw /dev/block/vold/179:2 /data/sdext2 1>>$LOG 2>>$LOG

mount -t ext2 -o rw /dev/block/mmcblk0p2 /data/sdext2 1>>$LOG 2>>$LOG

mount >> $LOG
echo "$(date) mount finished" >> $LOG
