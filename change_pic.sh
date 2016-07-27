#! /bin/sh
ssh chip@192.168.0.125 -t "rm ~/Slideshow/*"
scp ~/display/* chip@192.168.0.125:~/Slideshow/
ssh chip@192.168.0.125 -t "pkill xinit"
rm -r ~/display
echo -e "Display Updated"
