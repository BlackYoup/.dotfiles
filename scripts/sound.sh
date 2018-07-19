#!/bin/bash
echo Vol $(amixer -D pulse get Master | awk -F'[]%[]' '/%/ {if ($7 == "off") { print "MM" } else { print $2}}' | head -n 1)%
