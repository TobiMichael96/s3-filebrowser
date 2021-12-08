#!/bin/bash

# Check variables and defaults
if [ -z "${AWS_ACCESS_KEY}" -a -z "${AWS_SECRET_KEY}" ]; then
    echo "You need to provide some credentials!"
    exit
fi

# Check variables and defaults
if [ -z "${AWS_S3_BUCKET}" ]; then
    echo "You need to provide the bucket!"
    exit
fi

# Check variables
if [ "${DISABLE_AUTH}" ]; then
    echo "You disabled authentication!"
    additional_flag="--auth.method='none'"
fi

echo $AWS_ACCESS_KEY:$AWS_SECRET_KEY > /root/.passwd-s3fs
chmod 600 /root/.passwd-s3fs

mkdir /data

s3fs $AWS_S3_BUCKET /data

/filebrowser --root=/data --address=0.0.0.0 --database=/config/filebrowser.db $additional_flag
