#! /bin/sh
scp ~/display.pps chip@192.168.0.125:~/
ssh chip@192.168.0.125 -t "pkill xinit"
