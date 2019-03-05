# AnyKernel2 Ramdisk Mod Script
# osm0sis @ xda-developers
# blu_spark changes by eng.stk

## AnyKernel setup
# begin properties
properties() { '
kernel.string=Krieg Kernel - OnePlus 5/T by wrongway213 & ViRb3
do.devicecheck=1
do.modules=1
do.cleanup=1
do.cleanuponabort=0
device.name1=OnePlus5
device.name2=cheeseburger
device.name3=OnePlus5T
device.name4=dumpling
supported.versions=9
'; } # end properties

# shell variables
block=boot;
is_slot_device=0;
ramdisk_compression=auto;

## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. /tmp/anykernel/tools/ak2-core.sh;

## Trim partitions
fstrim -v /cache;
fstrim -v /data;

## AnyKernel file attributes
# set permissions/ownership for included ramdisk files
chmod -R 750 $ramdisk/*;
chown -R root:root $ramdisk/*;

## AnyKernel install
dump_boot;
# begin ramdisk changes
remove_section init.rc "service flash_recovery" ""
# Import init.krieg.rc file
insert_line init.rc "init.krieg.rc" after "import /init.usb.rc" "import /init.krieg.rc";
# Import spectrum.rc file
insert_line init.rc "init.spectrum.rc" after "import /init.krieg.rc" "import /init.spectrum.rc";
# end ramdisk changes
write_boot;

## end install

