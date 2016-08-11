#! /bin/bash
playing=$(mpc current -f %title%-%artist%)
leng=10
for ((i=1;i<${#playing};i++))
do
        leng=$(($leng+$i))
        echo "$(echo $playing| cut -c$i-$leng)"
        sleep 0.25
done

