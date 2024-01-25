#!/bin/bash

local DESTINATION_SERVER="$1"
export DESTINATION_SERVER=$DESTINATION_SERVER

# Inject the exported env variables to nginx `default.conf`.
cat default.conf.template | envsubst '$DESTINATION_SERVER' > /etc/nginx/conf.d/default.conf

# Start the server.
nginx

# Keep the container alive.
tail -f /dev/null
