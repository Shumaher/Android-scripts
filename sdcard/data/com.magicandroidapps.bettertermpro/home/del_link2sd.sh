#!/system/bin/sh

# del_link2sd.sh v1.0 (30.10.2013)

rm -f /system/etc/init.d/11link2sd

rm -f /system/bin/debuggerd													# remove Link2SD's debuggerd (this is script, not binary)
rm -f /system/bin/debuggerd.sh
mv /system/bin/debuggerd.bin /system/bin/debuggerd							# rename backed up debuggerd.bin to original name

rm -f /system/etc/install-recovery.sh										# remove Link2SD's install-recovery.sh
mv /system/etc/install-recovery.sh.ori /system/etc/install-recovery.sh && \	# rename backed up install-recovery.sh.ori to original name
echo "Link2SD script was removed!"
