#!/system/bin/sh

LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/system/lib

am start -a android.intent.action.MAIN -n com.magicandroidapps.bettertermpro/.BetterTerm
