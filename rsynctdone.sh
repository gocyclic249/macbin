RC=1 
while [[ $RC -ne 0 ]]
do
        rsync -avz ~/Media/Music 192.168.1.11:mnt/deadpool/Media/
              RC=$?
done
