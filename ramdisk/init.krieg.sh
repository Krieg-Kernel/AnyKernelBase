#!/system/bin/sh

# (c) 2018 changes for blu_spark by eng.stk

sleep 30;

# Tweak IO performance after boot complete
echo "anxiety" > /sys/block/dm-0/queue/scheduler
echo "anxiety" > /sys/block/dm-1/queue/scheduler
echo "anxiety" > /sys/block/sda/queue/scheduler
echo "anxiety" > /sys/block/sde/queue/scheduler
echo 1536 > /sys/block/dm-0/queue/read_ahead_kb
echo 0 > /sys/block/dm-0/queue/iostats
echo 128 > /sys/block/dm-0/queue/nr_requests
echo 1536 > /sys/block/dm-1/queue/read_ahead_kb
echo 0 > /sys/block/dm-1/queue/iostats
echo 128 > /sys/block/dm-1/queue/nr_requests
echo 1536 > /sys/block/sda/queue/read_ahead_kb
echo 0 > /sys/block/sda/queue/iostats
echo 128 > /sys/block/sda/queue/nr_requests
echo 1536 > /sys/block/sde/queue/read_ahead_kb
echo 0 > /sys/block/sde/queue/iostats
echo 128 > /sys/block/sde/queue/nr_requests

# Disable thermal hotplug to switch governor
echo 0 > /sys/module/msm_thermal/core_control/enabled
echo "disable" > /sys/devices/soc/soc:qcom,bcl/mode
echo 0 > /sys/devices/soc/soc:qcom,bcl/hotplug_mask
echo 0 > /sys/devices/soc/soc:qcom,bcl/hotplug_soc_mask
echo "enable" > /sys/devices/soc/soc:qcom,bcl/mode

# Disable scheduler core_ctl
echo 0 > /sys/devices/system/cpu/cpu0/core_ctl/enable
echo 0 > /sys/devices/system/cpu/cpu4/core_ctl/enable

# Re-enable thermal hotplug
echo 1 > /sys/module/msm_thermal/core_control/enabled
echo "disable" > /sys/devices/soc/soc:qcom,bcl/mode
echo 0 > /sys/devices/soc/soc:qcom,bcl/hotplug_mask
echo 0 > /sys/devices/soc/soc:qcom,bcl/hotplug_soc_mask
echo "enable" > /sys/devices/soc/soc:qcom,bcl/mode

# Enable OTG by default
echo 1 > /sys/class/power_supply/usb/otg_switch

echo "Boot krieg_kernel completed " > /dev/kmsg
