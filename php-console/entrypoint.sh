#!/bin/bash
set -e

if [ "$USERNAME" -a ! "$(id "$USERNAME")" ]; then

    if [ -z "$UNIX_UID" ]; then
        UNIX_UID=1000
    fi

    # Create user
    adduser -u "$UNIX_UID" -h /home/developer "$USERNAME" -s "$CONTAINER_SHELL" -D

    chown "$USERNAME:$USERNAME" /home/developer
fi

exec "$@"
