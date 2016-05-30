setxkbmap fr bepo
xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --dpi 96
xrandr --auto
/home/arnaud/scripts/xflux -l 47.169333 -g -1.721934
/usr/bin/python2.7 /home/arnaud/Dev/TraktForVLC/TraktForVLC.py --daemon
pkttyagent --process $$ &
syndaemon -i 1 -t -k -d
/opt/xmonad/xmonad
