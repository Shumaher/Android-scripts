#!/system/bin/sh

for cmd in $(./busybox --list); do
	./busybox ln -s busybox ./$cmd
done

ln -sf pigz ./gzip
ln -sf unpigz ./gunzip
