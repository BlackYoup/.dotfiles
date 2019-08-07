setxkbmap fr bepo
export GDK_SCALE=2
export QT_AUTO_SCREEN_SCALE_FACTOR=1
/usr/x86_64-pc-linux-gnu/bin/redshift -l manual -l 47.1718597:-1.7356033 -b 1:0.7 &
pkttyagent --process $$ &
/usr/x86_64-pc-linux-gnu/lib/xfce4/notifyd/xfce4-notifyd &
/usr/x86_64-pc-linux-gnu/bin/dbus-update-activation-environment --systemd DISPLAY=:0
gpaste-client start
~/.fehbg
/usr/bin/i3 -c /home/arnaud/.config/i3/config
