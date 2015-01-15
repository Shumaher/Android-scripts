#!/system/bin/sh

C="2"

if [ $C \> "1" ]
then
COUNT=$C
MSG="$COUNT WakeOnLan packets sent to $COMP!"
else
COUNT=1
MSG="WakeOnLan packet sent to $COMP!"
fi

i=0
while [ $i -lt $COUNT ]
do
echo ether-wake -b $MAC
echo "+"
i=$($i + 1)
echo "i = $i"
done
