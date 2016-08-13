#!/bin/bash

##Please fill in relevant information below. 

#Downloaded from S1mpleman at https://forums.plex.tv/discussion/177354/bash-script-download-youtube-content-ready-for-plex

echo "Input series name"

read rseries

series=$(echo "$rseries" | tr " " "_")

echo "Input URL"

read PLAYLIST


mkdir -p "$HOME/Media/Youtube/$series"
YOUTUBEOUT="$HOME/Media/Youtube/$series/$series-"
CDDIR="$HOME/Media/Youtube/$series"
ARCHIVEFILE="$HOME/Media/Youtube/Logs/$series.txt"

##Download new videos
youtube-dl -o "${YOUTUBEOUT}%(upload_date)s-%(title)s.%(ext)s" --write-description --download-archive ${ARCHIVEFILE} --add-metadata --ignore-errors ${PLAYLIST} 


##CD to correct directory##
cd "${CDDIR}"

## Rename all *.description to *.summary
rename 's/\.description$/\.summary/' *.description

## Rename the YYYYMMDD to YYYY-MM-DD files... 
rename -v 's/(\d{4})(\d{2})(\d{2})/$1-$2-$3/' *

