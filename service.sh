#!/system/bin/sh
MODDIR=/data/adb/modules/susfs4ksu

SUSFS_BIN=/data/adb/ksu/bin/ksu_susfs

source ${MODDIR}/utils.sh


## sus_su ##
enable_sus_su(){
        ## Create a 'overlay' folder in module root directory for storing the 'su' and sus_su_drv_path in /system/bin/ ##
        SYSTEM_OL=${MODDIR}/overlay
        rm -rf ${SYSTEM_OL}  2>/dev/null
        mkdir -p ${SYSTEM_OL}/system_bin 2>/dev/null
        ## Enable sus_su ##
        ${SUSFS_BIN} sus_su 1
        ## Copy the new generated sus_su_drv_path and 'sus_su' to /system/bin/ and rename 'sus_su' to 'su' ##
        cp -f /data/adb/ksu/bin/sus_su ${SYSTEM_OL}/system_bin/su
        cp -f /data/adb/ksu/bin/sus_su_drv_path ${SYSTEM_OL}/system_bin/sus_su_drv_path
        ## Setup permission ##
        susfs_clone_perm ${SYSTEM_OL}/system_bin /system/bin
        susfs_clone_perm ${SYSTEM_OL}/system_bin/su /system/bin/sh
        susfs_clone_perm ${SYSTEM_OL}/system_bin/sus_su_drv_path /system/bin/sh
        ## Mount the overlay ##
        mount -t overlay KSU -o "lowerdir=${SYSTEM_OL}/system_bin:/system/bin" /system/bin
        ## Hide the mountpoint ##
        ${SUSFS_BIN} add_sus_mount /system/bin
        ## Umount it for no root granted process ##
        ${SUSFS_BIN} add_try_umount /system/bin 1
}

## Enable sus_su ##
## Uncomment this if you are using kprobe hooks ksu, make sure CONFIG_KSU_SUSFS_SUS_SU config is enabled when compiling kernel ##
# enable_sus_su # comment this if you using tricky_store (because will break pm list packages if enabled)

## Disable susfs kernel log ##
${SUSFS_BIN} enable_log 0

## Props ##
resetprop -w sys.boot_completed 0

check_reset_prop "ro.boot.vbmeta.device_state" "locked"
check_reset_prop "ro.boot.verifiedbootstate" "green"
check_reset_prop "ro.boot.flash.locked" "1"
check_reset_prop "ro.boot.veritymode" "enforcing"
check_reset_prop "ro.boot.warranty_bit" "0"
check_reset_prop "ro.warranty_bit" "0"
check_reset_prop "ro.debuggable" "0"
check_reset_prop "ro.force.debuggable" "0"
check_reset_prop "ro.secure" "1"
check_reset_prop "ro.adb.secure" "1"
check_reset_prop "ro.build.type" "user"
check_reset_prop "ro.build.tags" "release-keys"
check_reset_prop "ro.vendor.boot.warranty_bit" "0"
check_reset_prop "ro.vendor.warranty_bit" "0"
check_reset_prop "vendor.boot.vbmeta.device_state" "locked"
check_reset_prop "vendor.boot.verifiedbootstate" "green"
check_reset_prop "sys.oem_unlock_allowed" "0"

# MIUI specific
check_reset_prop "ro.secureboot.lockstate" "locked"

# Realme specific
check_reset_prop "ro.boot.realmebootstate" "green"
check_reset_prop "ro.boot.realme.lockstate" "1"

# Hide that we booted from recovery when magisk is in recovery mode
contains_reset_prop "ro.bootmode" "recovery" "unknown"
contains_reset_prop "ro.boot.bootmode" "recovery" "unknown"
contains_reset_prop "vendor.boot.bootmode" "recovery" "unknown"

# Set vbmeta verifiedBootHash from file (if present and not empty)
HASH_FILE="/data/adb/VerifiedBootHash/VerifiedBootHash.txt"
if [ -s "$HASH_FILE" ]; then
    resetprop -v -n ro.boot.vbmeta.digest "$(tr '[:upper:]' '[:lower:]' <"$HASH_FILE")"
fi
