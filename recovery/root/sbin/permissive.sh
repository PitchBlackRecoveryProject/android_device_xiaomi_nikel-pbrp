#!/sbin/sh

# We use this shell script because the script will follow symlinks and
# different trees will use different binaries to supply the setenforce
# tool. Before M we use toolbox, M and beyond will use toybox. The init
# binary and init.rc will not follow symlinks.
# fix touchscreen bug by cofface

if [ -f /sys/bus/i2c/devices/4-004a/update_cfg ]; then
	mkdir -p /etc/firmware && chmod 777 /etc/firmware -R ;
	cp -f /sbin/touch.raw /etc/firmware ;
	ucfg=/sys/bus/i2c/devices/4-004a/update_cfg ;
	chmod 777 $ucfg ;
	echo "touch.raw" > $ucfg ;
	sleep 1
	rm -rf /etc/firmware
fi

exec /sbin/mc -b -r /system/app/mcRegistry/020f0000000000000000000000000000.drbin -r /system/app/mcRegistry/05120000000000000000000000000000.drbin -r /system/app/mcRegistry/070b0000000000000000000000000000.drbin -r /system/app/mcRegistry/020b0000000000000000000000000000.drbin -r /system/app/mcRegistry/05070000000000000000000000000000.drbin -r /system/app/mcRegistry/04020000000000000000000000000000.drbin -r /system/app/mcRegistry/05230000000000000000000000000000.drbin

setenforce 0
