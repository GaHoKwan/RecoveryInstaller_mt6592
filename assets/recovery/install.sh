#!/system/bin/sh

dir=/data/data/com.main.recoveryinstaller/files/recovery
busybox=$dir/busybox

mount -o rw,remount /system

chmod 755 $busybox
$busybox cp -Rf $busybox /system/xbin
chmod 6755 /system/xbin/busybox

$busybox dd if=$dir/recovery.img of=/dev/block/mmcblk0 seek=82688

mount -o ro,remount /system

