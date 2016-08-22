#!/bin/bash

echo "kill gpg-agent"
code=0
while [ 1 -ne $code ]; do
          killall gpg-agent
            code=$?
              sleep 1
      done

      echo "kill ssh"
      killall ssh

      echo "kill ssh muxers"
      for pid in `ps -ef | grep ssh | grep -v grep | awk '{print $2}'`; do
                kill $pid
        done

        echo "restart gpg-agent"
[ -f ~/.gpg-agent-info ] && source ~/.gpg-agent-info
if [ -S "${GPG_AGENT_INFO%%:*}" ]; then
          export GPG_AGENT_INFO
  else
            eval $( gpg-agent --daemon --write-env-file ~/.gpg-agent-info )
    fi
        echo "All done. Now unplug / replug the NEO token."
        echo
