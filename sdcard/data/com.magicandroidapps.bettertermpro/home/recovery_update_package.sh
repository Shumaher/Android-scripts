#!/bin/sh

adb shell
su
rmdir "cache/recovery/command"
mkdir "cache/recovery"
echo 'boot-recovery ' > /cache/recovery/command
echo '--update_package=SDCARD:OTA_Marvel_S_HTC_Europe_2.26.401.3-2.13.401.3_release_2617117t5xizmcxam8j8v6.zip' >> /cache/recovery/command
reboot recovery
