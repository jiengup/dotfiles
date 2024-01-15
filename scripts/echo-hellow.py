#!/usr/bin/env python3

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title echo hellow
# @raycast.mode fullOutput

# Optional parameters:
# @raycast.icon 🤖
# @raycast.argument1 { "type": "text", "placeholder": "Placeholder" }

# Documentation:
# @raycast.author jiengup
# @raycast.authorURL https://raycast.com/jiengup

import sys
print("Hello World! Argument1 value: " + sys.argv[1])

