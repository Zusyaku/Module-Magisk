#!/system/bin/sh
# XForce DXT-7110 | Version 1.3
# (c) 2014 RenzkiPH

# Safe Mounting
mount -o remount,rw /system 2>/dev/null
mount -o remount,rw / 2>/dev/null
mount -o remount,rw rootfs 2>/dev/null

if [ -e /sqlite_stmt_journals ]; then
   mkdir /sqlite_stmt_journals 2>/dev/null
   chmod 777 /sqlite_stmt_journals 2>/dev/null
   chown 0:0 /sqlite_stmt_journals 2>/dev/null
fi 2>/dev/null

LOG=/data/XForce_DXT-7110.log

if [ -e $LOG ]; then
   rm -f $LOG 2>/dev/null
fi 2>/dev/null

R='\e[1;31m'
C='\e[1;37m'
G='\e[1;32m'
NC='\e[0m'

while true; do
clear
if [ ! -e /system/xbin/xforce ]; then
echo -e "${G} XForce Gaming DXT-7110 Installer ${NC}"
echo -e "${G} (c) 2014 RenzkiPH ${NC}"
echo
echo -e "${C} [I]nstall XForce Gaming DXT-7110 ${NC}"
echo -e "${C} [E]xit ${NC}"
echo
echo -ne "${C} Please Type Your Option: "
read tw

case $tw in
i|I)
echo
echo -e "${C} Installing XForce Gaming DXT-7110... ${NC}"
sleep 5
cat >> /system/xbin/xforce <<EOF
#!/system/bin/sh
# XForce Gaming DXT-7110
# (c) 2014 RenzkiPH

LOG=/data/XForce_DXT-7110.log

if [ -e \$LOG ]; then
   rm -f \$LOG 2>/dev/null
fi 2>/dev/null

R='\e[1;31m'
C='\e[1;37m'
G='\e[1;32m'
NC='\e[0m'

echo "Date: \$( date +"%m-%d-%Y" )" >> \$LOG
echo -e "\${C} Running XForce Gaming DXT-7110... \${NC}"
echo "\$( date +"%H:%M:%S" ) Running XForce Gaming DXT-7110..." >> \$LOG
sleep 30

# RAM Settings
lmkaj=/sys/module/lowmemorykiller/parameters/adj;
lmkme=/sys/module/lowmemorykiller/parameters/minfree;

if [ -e \$lmkaj ]; then
echo "0,6,8,10,12,15" >> \$lmkaj
fi

if [ -e \$lmkme ]; then
echo "2048,4096,46080,51200,57600,64000" >> \$lmkme
fi

setprop persist.sys.purgeable_assets 1;

# Graphic Settings
setprop persist.sys.NV_FPSLIMIT 60;
setprop persist.sys.NV_POWERMODE 1;
setprop persist.sys.NV_PROFVER 15;
setprop persist.sys.NV_STEREOCTRL 0;
setprop persist.sys.NV_STEREOSEPCHG 0;
setprop persist.sys.NV_STEREOSEP 20;
setprop debug.sf.showupdates 0;
setprop debug.sf.showcpu 0;
setprop debug.sf.showbackground 0;
setprop debug.sf.showfps 0;
setprop debug.egl.hw 1;
setprop debug.sf.hw 1;
setprop debug.composition.type gpu;
setprop debug.performance.tuning 1;
setprop ro.config.disable.hw_accel 0;
setprop ro.sf.compbypass.enable 0;
setprop video.accelerate.hw 1;
setprop persist.android.strictmode 0;
setprop ro.min_pointer_dur 1;
setprop ro.secure 0;
setprop hw3d.force 1;
setprop hw2d.force 1;
setprop debug.egl.profiler 1;
setprop debug.enabletr true;
setprop debug.gr.numframebuffers 3;
setprop persist.service.lgospd.enable 0;
setprop persist.service.pcsync.enable 0;
setprop windowsmgr.max_events_per_sec 90;
setprop ro.max.fling_velocity 16000;
setprop ro.min.fling_velocity 12000;
setprop touch.presure.scale 0.001;

ST=/sys/class/touch/switch/set_touchscreen 
if [ -e \$ST ]; then
   busybox echo "7035" > \$ST
   busybox echo "8002" > \$ST
   busybox echo "11000" > \$ST
   busybox echo "13060" > \$ST
   busybox echo "14005" > \$ST
fi 2>/dev/null

# Kernel Performance Settings
busybox sysctl -e -w -q vm.swappiness=0;
busybox sysctl -e -w -q vm.min_free_kbytes=23040;
busybox sysctl -e -w -q vm.dirty_ratio=90;
busybox sysctl -e -w -q vm.dirty_background_ratio=70;
busybox sysctl -e -w -q vm.vfs_cache_pressure=20;
busybox sysctl -e -w -q vm.panic_on_oom=0;
busybox sysctl -e -w -q vm.oom_kill_allocating_task=1;
busybox sysctl -e -w -q kernel.panic=0;
busybox sysctl -e -w -q kernel.shmmni=4096;
busybox sysctl -e -w -q kernel.shmall=2097152;
busybox sysctl -e -w -q kernel.shmmax=268435456; 
busybox sysctl -e -w -q vm.dirty_writeback_centisecs=2500;
busybox sysctl -e -w -q vm.dirty_expire_centisecs=1500; 

# Application Optimization
if [ "\`pgrep zygote\`" ]; then
   busybox renice -8 \`pgrep zygote\`;
fi

if [ "\`pgrep mediaserver\`" ]; then
   busybox renice -8 \`pgrep mediaserver\`;
fi

setprop ENFORCE_PROCESS_LIMIT false
setprop ACTIVITY_INACTIVE_RESET_TIME false
setprop APP_SWITCH_DELAY_TIME false 
setprop MIN_HIDDEN_APPS false
setprop MAX_HIDDEN_APPS false
setprop MAX_RECENT_TASKS false
setprop MIN_RECENT_TASKS false
setprop MAX_PROCESSES false
setprop MAX_ACTIVITIES false
setprop MAX_SERVICE_INACTIVITY false

# Cleaner
busybox rm -f /data/local/tmp/* 2>/dev/null
busybox rm -f /tmp/* 2>/dev/null
busybox rm -f /data/*.log 2>/dev/null
busybox rm -f /data/*.tmp
busybox rm -f /cache/*.apk 2>/dev/null
busybox rm -f /cache/*.tmp 2>/dev/null
busybox rm -f /sdcard/LOST.DIR/* 2>/dev/null
busybox rm -f /data/system/usagestats/* 2>/dev/null
busybox rm -f /data/tombstones/* 2>/dev/null
busybox rm -f /data/anr/* 2>/dev/null

sleep 30
echo "\$( date +"%H:%M:%S" ) XForce Gaming DXT-7110 Successfully Runned..." >> \$LOG
echo -e "\${C} XForce Gaming DXT-7110 Successfully Runned... \${NC}"
sleep 5
EOF

chmod 755 /system/xbin/xforce 2>/dev/null
chown 0:0 /system/xbin/xforce 2>/dev/null
sleep 5
echo -e "${C} XForce Gaming DXT-7110 Installed... ${NC}"
sleep 5
;;
e|E)
mount -o remount,ro /system 2>/dev/null
mount -o remount,ro / 2>/dev/null
mount -o remount,ro rootfs 2>/dev/null
echo
echo -e "${C} Exiting... ${NC}"
sleep 5
exit 0
;;
*)
echo
echo -e "${R} Invalid Option! ${NC}"
sleep 5
;;
esac
else
echo -e "${G} XForce Gaming DXT-7110 Installer ${NC}"
echo -e "${G} (c) 2014 RenzkiPH ${NC}"
echo
echo -e "${C} [U]ninstall XForce Gaming DXT-7110 ${NC}"
echo -e "${C} [R]un XForce Gaming ${NC}"
echo -e "${C} [E]xit ${NC}"
echo
echo -ne "${C} Please Type Your Option: "
read tw

case $tw in
u|U)
echo
echo -e "${C} Uninstalling XForce Gaming DXT-7110... ${NC}"
sleep 5
rm -rf /system/xbin/xforce 2>/dev/null
sleep 5
echo -e "${C} XForce Gaming DXT-7110 Uninstalled... ${NC}"
sleep 5
;;
r|R)
echo
sh /system/xbin/xforce 2>/dev/null
sleep 5
;;
e|E)
mount -o remount,ro /system 2>/dev/null
mount -o remount,ro / 2>/dev/null
mount -o remount,ro rootfs 2>/dev/null
echo
echo -e "${C} Exiting... ${NC}"
sleep 5
exit 0
;;
*)
echo
echo -e "${R} Invalid Option! ${NC}"
sleep 5
;;
esac
fi
done