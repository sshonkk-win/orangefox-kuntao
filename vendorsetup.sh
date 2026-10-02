#
# OrangeFox vendorsetup for Lenovo P2a42 (kuntao_row)
# Ported from the legacy omni_android-7.1 TWRP tree.
# Tested target branch: fox_9.0 (recommended for this Android 6/7-era device).
#

FDEVICE="kuntao_row"

fox_get_target_device() {
	local chkdev=$(echo "$BASH_SOURCE" | grep -w $FDEVICE)
	if [ -n "$chkdev" ]; then
		FOX_BUILD_DEVICE="$FDEVICE"
	else
		chkdev=$(set | grep BASH_ARGV | grep -w $FDEVICE)
		[ -n "$chkdev" ] && FOX_BUILD_DEVICE="$FDEVICE"
	fi
}

if [ -z "$1" -a -z "$FOX_BUILD_DEVICE" ]; then
	fox_get_target_device
fi

if [ "$1" = "$FDEVICE" -o "$FOX_BUILD_DEVICE" = "$FDEVICE" ]; then
	export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER=1
	export TW_DEFAULT_LANGUAGE="en"
	export LC_ALL="C"
	export ALLOW_MISSING_DEPENDENCIES=true
	export TARGET_DEVICE_ALT="kuntao"

	# OrangeFox UI / features — A-only legacy device, no A/B, no dynamic partitions
	export FOX_RESET_SETTINGS="disabled"
	export FOX_USE_BASH_SHELL=1
	export FOX_ASH_IS_BASH=1
	export FOX_USE_NANO_EDITOR=1
	export FOX_USE_TAR_BINARY=1
	export FOX_USE_SED_BINARY=1
	export FOX_USE_XZ_UTILS=1
	export FOX_REPLACE_BUSYBOX_PS=1
	export OF_USE_MAGISKBOOT=1
	export OF_USE_MAGISKBOOT_FOR_ALL_PATCHES=1
	export OF_NO_TREBLE_COMPATIBILITY_CHECK=1
	export OF_SKIP_MULTIUSER_FOLDERS_BACKUP=1
	export OF_QUICK_BACKUP_LIST="/boot;/system;/data;"
	export FOX_R11=1
	export FOX_VERSION="R11.1"
	export OF_MAINTAINER="kuntao-port"

	# Screen: 5.5" 1080x1920, no notch
	export OF_SCREEN_H=1920
	export OF_STATUS_H=80
	export OF_STATUS_INDENT_LEFT=48
	export OF_STATUS_INDENT_RIGHT=48
	export OF_HIDE_NOTCH=0
	export OF_CLOCK_POS=1

	# Run a post-format process to work around MTP issues after data format
	export OF_RUN_POST_FORMAT_PROCESS=1

	if [ -n "$FOX_BUILD_LOG_FILE" -a -f "$FOX_BUILD_LOG_FILE" ]; then
		export | grep "FOX" >> $FOX_BUILD_LOG_FILE
		export | grep "OF_" >> $FOX_BUILD_LOG_FILE
		export | grep "TW_" >> $FOX_BUILD_LOG_FILE
		export | grep "TARGET_" >> $FOX_BUILD_LOG_FILE
	fi

	for var in eng userdebug; do
		add_lunch_combo omni_"$FDEVICE"-$var
	done
fi
