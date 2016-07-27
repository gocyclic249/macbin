#!/bin/bash

##
## I use this script to output the battery level when working in a full-
## screen Tmux environment. The output (for coloring) assumes that you
## are working in Tmux. Right now I just have it working for my mac
## (OS X 10.6). Feel free to fork and add your own OS.
## 

if [ `uname` = 'Darwin' ] ; then
          percent=`ioreg -l | grep -i capacity | tr '\n' ' | ' | awk '{printf("%d", $10/$5 * 100)}'`
  fi


  if   (( percent > 80 )); then color='#[fg=green]'
         elif (( percent > 65 )); then color='#[fg=yellow]'
         elif (( percent > 40 )); then color='#[fg=red]'
        else color='#[fg=red]'
  fi
echo "$color $percent%"
