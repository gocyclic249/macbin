#!/bin/bash

##Please fill in relevant information below. 

#Downloaded from S1mpleman at https://forums.plex.tv/discussion/177354/bash-script-download-youtube-content-ready-for-plex

YOUTUBEOUT="$HOME/Media/Youtube/"
CDDIR="$HOME/Media/Youtube/"
ARCHIVEFILE="$HOME/Media/Youtube/Logs/"

while getopts ":u:" opt; do
        youtube-dl -o "${YOUTUBEOUT}%(playlist)s/%(playlist)s-%(upload_date)s-%(title)s.%(ext)s" --write-all-thumbnails --write-description --download-archive "${ARCHIVEFILE}/%(playlist)s" --add-metadata --ignore-errors -a "$ARCHIVEFILE/urls"  
        fixname
        exit 0
done

echo "Input URL"

read PLAYLIST

echo "$PLAYLIST" >> $ARCHIVEFILE/urls

##Download new videos
youtube-dl -o "${YOUTUBEOUT}%(playlist)s/%(playlist)s-%(upload_date)s-%(title)s.%(ext)s" --write-all-thumbnails --write-description --download-archive "${ARCHIVEFILE}/%(playlist)s" --add-metadata --ignore-errors ${PLAYLIST} 
fixname

fixname(){
##CD to correct directory##
cd "${CDDIR}"

## Rename all *.description to *.summary
rename 's/\.description$/\.summary/' *.description

## Rename the YYYYMMDD to YYYY-MM-DD files... 
rename -v 's/(\d{4})(\d{2})(\d{2})/$1-$2-$3/' **

rename "s/ /_/g" **
}
