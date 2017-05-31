#!/bin/bash

# Check if Env variables are set. Exit the container and print an error message if they're not.

if [ -z "$SYNC_PATH" ]; then
    echo "Environment variable SYNC_PATH is not set!!!"
    exit 1
fi
if [ -z "$BUCKET" ]; then
    echo "Environment variable BUCKET is not set!!!"
    exit 1
fi
if [ -z "$AWS_SECRET_ACCESS_KEY" ]; then
    echo "Environment variable AWS_SECRET is not set!!!"
    exit 1
fi
if [ -z "$AWS_ACCESS_KEY_ID" ]; then
    echo "Environment variable AWS_SECRET is not set!!!"
    exit 1
fi

# Create nginx supervisord log folder
mkdir -p /var/log/nginx

# echo env vars
echo "SYNC_PATH": $SYNC_PATH
echo "BUCKET": $BUCKET
echo "AWS_SECRET_ACCESS_KEY": $AWS_SECRET_ACCESS_KEY
echo "AWS_ACCESS_KEY_ID": $AWS_ACCESS_KEY_ID


# Start supervisord passing in the conf file
supervisord -c /supervisord.conf
