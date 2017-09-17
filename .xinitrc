setxkbmap fr bepo
xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --dpi 96
xrandr --auto
/usr/x86_64-pc-linux-gnu/bin/redshift -l manual -l 47.1718597:-1.7356033 &
pkttyagent --process $$ &
syndaemon -i 1 -t -k -d
/usr/x86_64-pc-linux-gnu/lib/xfce4/notifyd/xfce4-notifyd &
/usr/x86_64-pc-linux-gnu/bin/dbus-update-activation-environment --systemd DISPLAY=:0
gpaste-client start
/usr/bin/i3 -c /home/arnaud/.config/i3/config
