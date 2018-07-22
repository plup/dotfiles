#!/bin/bash

# check if borg is already running
if pidof -x borg >/dev/null; then
    echo "Backup already running"
    exit 1
fi

REPOSITORY=ssh://u178762@u178762.your-storagebox.de:23/./backups

borg create --stats --progress                  \
    $REPOSITORY::$(hostname)-$USER-$(date +%F)  \
    --patterns-from ~/.backup.lst               \
    --exclude-if-present .nobackup              \
    --keep-exclude-tag
