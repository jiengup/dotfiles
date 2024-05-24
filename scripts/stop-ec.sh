#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Stop EC
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🤖

# Documentation:
# @raycast.description Stop EasyConnect
# @raycast.author jiengup
# @raycast.authorURL https://raycast.com/jiengup

fuckEC() {
    function killprocess()
    {
        processname=$1
        killall $processname >/dev/null 2>&1
        proxypids=$(ps aux | grep -v grep | grep $processname | awk '{print $2}')
        for proxypid in $proxypids
        do
            kill -9 $proxypid
        done
    }

    killprocess svpnservice
    killprocess CSClient
    killprocess ECAgentProxy
    killprocess /Applications/EasyConnect.app/Contents/MacOS/EasyConnect

    pkill ECAgent
    pkill EasyMonitor
}

fuckEC
