#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Multiple Iterm2
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🐚

# Documentation:
# @raycast.description New a Iterm2 window.
# @raycast.author jiengup
# @raycast.authorURL https://raycast.com/jiengup

# Detects if iTerm2 is running
if ! pgrep -f "iTerm" > /dev/null 2>&1; then
    open -a "/Applications/iTerm.app"
else
    # Create a new window
    script='tell application "iTerm2" to create window with default profile'
    ! osascript -e "${script}" > /dev/null 2>&1 && {
        # Get pids for any app with "iTerm" and kill
        while IFS="" read -r pid; do
            kill -15 "${pid}"
        done < <(pgrep -f "iTerm")
        open -a "/Applications/iTerm.app"
    }
fi
