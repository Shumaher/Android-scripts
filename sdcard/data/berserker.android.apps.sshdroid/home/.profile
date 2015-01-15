export BTEP=/data/data/com.magicandroidapps.bettertermpro
export BTEPSD=/sdcard/data/com.magicandroidapps.bettertermpro
export SSHD=/data/data/berserker.android.apps.sshdroid
export PATH=$SSHD/home/bin:$PATH

if [ -e "$BTEP/bin/bash" ];
then
$BTEP/bin/bash --rcfile $BTEPSD/home/local_profile
else
echo "./bin/sh"
sh
fi
