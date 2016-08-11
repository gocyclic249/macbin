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
        eval $(gpg-agent --daemon)

        echo
if [ -f "${HOME}/.gpg-agent-info" ]; then
  . "${HOME}/.gpg-agent-info"
  export GPG_AGENT_INFO
  export SSH_AUTH_SOCK
  export SSH_AGENT_PID
fi
        echo "All done. Now unplug / replug the NEO token."
        echo
