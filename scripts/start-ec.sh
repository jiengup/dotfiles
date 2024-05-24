#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Start EC
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🤖

# Documentation:
# @raycast.description Start EasyConnect
# @raycast.author jiengup
# @raycast.authorURL https://raycast.com/jiengup

startEC() {
    /Applications/EasyConnect.app/Contents/Resources/bin/EasyMonitor > /dev/null 2>&1 &
    /Applications/EasyConnect.app/Contents/MacOS/EasyConnect > /dev/null 2>&1 &
}

startEC
