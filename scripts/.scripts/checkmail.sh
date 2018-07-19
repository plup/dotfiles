#!/bin/sh

# check network connection
wicd-cli -i | grep 'status: Connected' > /dev/null
if [ $? -eq 0 ]; then
    exec offlineimap
fi
echo "No internet connection."
exit 0
