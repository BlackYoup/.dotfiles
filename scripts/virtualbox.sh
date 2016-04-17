#!/bin/bash

modprobe -rv vboxdrv
modprobe -rv vboxnetadp
modprobe -rv vboxnetflt
modprobe -rv vboxpci

modprobe -v vboxdrv
modprobe -v vboxnetadp
modprobe -v vboxnetflt
modprobe -v vboxpci
