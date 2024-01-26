#!/bin/bash

DESTINATION_HTTP_SERVER="$1"
export DESTINATION_HTTP_SERVER=$DESTINATION_HTTP_SERVER
DESTINATION_HTTPS_SERVER="$2"
export DESTINATION_HTTPS_SERVER=$DESTINATION_HTTPS_SERVER

# Inject the exported env variables to nginx `default.conf`.
cat default.conf.template | envsubst '$DESTINATION_HTTP_SERVER $DESTINATION_HTTPS_SERVER' > /etc/nginx/conf.d/default.conf

# Start the server.
nginx

# Keep the container alive.
tail -f /dev/null
