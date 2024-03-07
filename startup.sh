#!/bin/bash

DESTINATION_HOST="$1"
DESTINATION_SERVER="$2"
export DESTINATION_HOST=$DESTINATION_HOST
export DESTINATION_SERVER=$DESTINATION_SERVER

# Inject the exported env variables to nginx `default.conf`.
cat default.conf.template | envsubst '$DESTINATION_HOST $DESTINATION_SERVER' > /etc/nginx/conf.d/default.conf

# Start the server.
nginx

# Keep the container alive.
tail -f /dev/null
