#!/bin/sh
set -e

# Ashvin Labs: Docker Socket Permission Fix
if [ -e /var/run/docker.sock ]; then
    echo "💎 Ashvin Entrypoint: Adjusting Docker socket permissions..."
    # We are running as root here (ENTRYPOINT), so we can chmod
    chmod 666 /var/run/docker.sock
fi

# Hand over to the node user
exec gosu node "$@"
