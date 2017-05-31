#!/bin/bash

# Check if Env variables are set. Exit the container and print an error message if they're not.

if [ -z "$PATH" ]; then
    echo "Environment variable PATH is not set!!!"
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

# Start AWS S3 Sync Crontab
chmod 600 /etc/crontab
crontab /var/crontab.txt

# echo env vars
echo "PATH": $PATH
echo "BUCKET": $BUCKET
echo "AWS_SECRET_ACCESS_KEY": $AWS_SECRET_ACCESS_KEY
echo "AWS_ACCESS_KEY_ID": $AWS_ACCESS_KEY_ID

# Start supervisord passing in the conf file
supervisord -c /supervisord.conf
