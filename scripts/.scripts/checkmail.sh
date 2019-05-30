#!/bin/bash
set -e

# check network connection
wicd-cli -i | grep 'status: Connected' > /dev/null
if [ $? -eq 0 ]; then
    mbsync -a 2> /dev/null
    notmuch new
    exit 0
fi
echo "No internet connection."
