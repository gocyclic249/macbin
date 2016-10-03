#!/bin/bash
sudo kill -9 $(pidof scdaemon)
sudo kill -9 $(pidof gpg-agent)
sudo launchctl unload /System/Library/LaunchDaemons/com.apple.ifdreader.plist
gpg-agent --daemon --write-env-file 
gpg --card-status > /dev/null
echo $( ssh-add -l)
