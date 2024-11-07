#!/system/bin/sh

MODDIR=/data/adb/modules/susfs4ksu

SUSFS_BIN=/data/adb/ksu/bin/ksu_susfs

source ${MODDIR}/utils.sh

#Custom Rom
${SUSFS_BIN} add_sus_path /system/addon.d
${SUSFS_BIN} add_sus_path /vendor/bin/install-recovery.sh
${SUSFS_BIN} add_sus_path /system/bin/install-recovery.sh
${SUSFS_BIN} add_sus_path /system/vendor/bin/install-recovery.sh
${SUSFS_BIN} add_sus_path /system/etc/permissions/privapp-permissions-com.crdroid.faceunlock.xml
${SUSFS_BIN} add_sus_path /system/etc/sysconfig/hiddenapi-whitelist-com.crdroid.faceunlock.xml
${SUSFS_BIN} add_sus_path /system_ext/etc/permissions/privapp_whitelist_com.crdroid.updater.xml
${SUSFS_BIN} add_sus_path /system_ext/etc/init/init.crdroid-system_ext.rc/system/framework/org.lineageos.platform-res.apk
${SUSFS_BIN} add_sus_path /system/framework/oat/arm64/org.lineageos.platform.vdex
${SUSFS_BIN} add_sus_path /system/framework/oat/arm64/org.lineageos.platform.odex
${SUSFS_BIN} add_sus_path /system/framework/org.lineageos.platform-res.apk
${SUSFS_BIN} add_sus_path /system/framework/oat/arm64/org.lineageos.platform.vdex
${SUSFS_BIN} add_sus_path /system/framework/oat/arm64/org.lineageos.platform.odex
${SUSFS_BIN} add_sus_path /system/framework/org.lineageos.platform.jar
${SUSFS_BIN} add_sus_path /system/addon.d/50-lineage.sh
${SUSFS_BIN} add_sus_path /product/etc/permissions/org.lineageos.settings.xml
${SUSFS_BIN} add_sus_path /product/etc/permissions/org.lineageos.trust.xml
${SUSFS_BIN} add_sus_path /product/etc/permissions/org.lineageos.profiles.xml
${SUSFS_BIN} add_sus_path /product/etc/permissions/org.lineageos.android.xml
${SUSFS_BIN} add_sus_path /product/etc/permissions/org.lineageos.hardware.xml
${SUSFS_BIN} add_sus_path /product/etc/permissions/org.lineageos.globalactions.xml
${SUSFS_BIN} add_sus_path /product/etc/permissions/privapp_whitelist_org.lineageos.eleven.xml
${SUSFS_BIN} add_sus_path /product/etc/permissions/org.lineageos.livedisplay.xml
${SUSFS_BIN} add_sus_path /product/etc/sysconfig/lineage-sysconfig.xml
${SUSFS_BIN} add_sus_path /product/etc/sysconfig/org.lineageos.etar.allowlist.xml
${SUSFS_BIN} add_sus_path /product/overlay/org.lineageos.platform-res__auto_generated_rro_product.apk
${SUSFS_BIN} add_sus_path /system_ext/etc/permissions/privapp_whitelist_org.lineageos.lineageparts.xml
${SUSFS_BIN} add_sus_path /system_ext/etc/permissions/privapp_whitelist_org.lineageos.audiofx.xml
${SUSFS_BIN} add_sus_path /system_ext/etc/permissions/privapp_whitelist_org.lineageos.lineagesettings.xml
${SUSFS_BIN} add_sus_path /system_ext/etc/permissions/privapp_whitelist_org.lineageos.setupwizard.xml
${SUSFS_BIN} add_sus_path /system_ext/etc/init/init.lineage-system_ext.rc
${SUSFS_BIN} add_sus_path /system_ext/etc/init/init.lineage-updater.rc

#KernelSU
${SUSFS_BIN} add_sus_mount /data/adb/modules
${SUSFS_BIN} add_sus_mount /debug_ramdisk

#LSPosed
${SUSFS_BIN} add_sus_mount /data/adb/modules/zygisk_lsposed/bin/dex2oat
${SUSFS_BIN} add_sus_mount /data/adb/modules/zygisk_lsposed/bin/dex2oat32
${SUSFS_BIN} add_sus_mount /data/adb/modules/zygisk_lsposed/bin/dex2oat64
${SUSFS_BIN} add_sus_mount /system/apex/com.android.art/bin/dex2oat
${SUSFS_BIN} add_sus_mount /system/apex/com.android.art/bin/dex2oat32
${SUSFS_BIN} add_sus_mount /system/apex/com.android.art/bin/dex2oat64
${SUSFS_BIN} add_sus_mount /apex/com.android.art/bin/dex2oat
${SUSFS_BIN} add_sus_mount /apex/com.android.art/bin/dex2oat32
${SUSFS_BIN} add_sus_mount /apex/com.android.art/bin/dex2oat64
${SUSFS_BIN} add_try_umount /system/apex/com.android.art/bin/dex2oat 1
${SUSFS_BIN} add_try_umount /system/apex/com.android.art/bin/dex2oat32 1
${SUSFS_BIN} add_try_umount /system/apex/com.android.art/bin/dex2oat64 1
${SUSFS_BIN} add_try_umount /apex/com.android.art/bin/dex2oat 1
${SUSFS_BIN} add_try_umount /apex/com.android.art/bin/dex2oat32 1
${SUSFS_BIN} add_try_umount /apex/com.android.art/bin/dex2oat64 1

#Modules for mounting system
${SUSFS_BIN} add_sus_mount /system

# rename kernel
${SUSFS_BIN} set_uname '6.1.137-android14-11-gb572b1fac135-ab11919372' '#1 SMP PREEMPT Fri Nov 1 16:35:10 UTC 2024'

