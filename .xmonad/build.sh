#! /usr/bin/env bash

/usr/bin/ghc -D"MIN_VERSION_base(x,y,z)=1" -i./Xmonadextras xmonad.hs
