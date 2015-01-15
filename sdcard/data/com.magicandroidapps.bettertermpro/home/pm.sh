#!/system/bin/sh


export PATH=/data/data/berserker.android.apps.sshdroid/home/bin:$PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/system/lib

echo6()
{
echo
echo
echo
echo
echo
echo
}

case $1 in

	"d")
##pm disable com.htc.widget.profile		## doesn't exist in Wildfire S, com.htc.profilewidget already disabled (renamed?)
##pm disable com.htc.htcmsgwidgets3d	## doesn't exist in Wildfire S
##pm disable com.htc.rosiewidgets.datastrip
#pm disable com.htc.opensense		# already disabled
##pm disable com.htc.widget3d.watch
#pm disable com.htc.htccalendarwidgets
##pm disable com.htc.Sync3DWidget
##pm disable com.htc.dlnamediaserver
##pm disable com.htc.ereader
##pm disable com.htc.connectedMedia
#pm disable com.htc.streamplayer		# NOT!
##pm disable com.amazon.mp3
##pm disable com.htc.livewallpaper.streak
#pm disable com.htc.skinpicker
##pm disable com.htc.clock3dwidget
##pm disable com.htc.rosiewidgets.dataroaming
##pm disable com.htc.FMRadioWidget
#pm disable com.htc.htcsettingwidgets
##pm disable com.htc.autorotatewidget
##pm disable com.htc.friendstream
#pm disable com.htc.rosiewidgets.tip
##pm disable com.htc.MusicWidget3D
##pm disable com.htc.footprints.widget3d
##pm disable com.htc.rosiewidgets.screenbrightness
##pm disable com.htc.android.fusion.recommend
##pm disable com.htc.ereader.widget3d
##pm disable com.htc.dockmode
#pm disable com.htc.htcmailwidgets
#pm disable com.htc.htctwitter
##pm disable com.htc.rosiewidgets.backgrounddata
##pm disable com.htc.fusion.FusionApk
#pm disable com.htc.CustomizationSetup
#pm disable com.htc.mysketcher
#pm disable com.htc.AddProgramWidget
pm disable com.htc.googlereader && \ # in Accounts
pm disable com.htc.launcher && \
##pm disable com.htc.musicenhancer
#pm disable com.htc.soundrecorder	# NOT!
pm disable com.htc.FilePicker && \
##pm disable com.htc.googlereaderwidget
##pm disable com.htc.htcsprintservice
##pm disable com.htc.tetheringguard
##pm disable com.htc.android.footprints
##pm disable com.htc.FriendStream3DWidget
#pm disable com.htc.recommend
##pm disable com.htc.stockwidget
pm disable com.htc.wotaproviders && \
##pm disable com.htc.HtcNaviPanel
##pm disable com.htc.Trends3DWidget
##pm disable com.htc.photowidget3d
##pm disable com.htc.Twitter3DWidget
#pm disable com.htc.widget.ringtone
#pm disable com.htc.socialnetwork.facebook
#pm disable com.htc.socialnetwork.flickr
##pm disable com.htc.android.netlogger
##pm disable com.htc.fusion.htcbookmarkwidget
##pm disable com.htc.htccontactwidgets_3d_fusion
#pm disable com.htc.android.worldclock	# NOT!
echo "De Sense, packages disabled!"
echo6
	;;

	"e")
pm enable com.htc.googlereader && \
pm enable com.htc.launcher && \
pm enable com.htc.FilePicker && \
pm enable com.htc.wotaproviders && \
echo "Re Sense, packages enabled!"
echo6
	;;

	"l")
pm list packages -f
echo6
	;;

	"ld")
pm list packages -f -d
echo6
	;;
	
	"le")
pm list packages -f -e
echo6
	;;
	
esac
