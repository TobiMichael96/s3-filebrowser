FROM python:slim-buster

## Some utilities
RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
        apt-get install -y curl git automake tar fuse libfuse-dev libcurl4-openssl-dev libxml2-dev make s3fs

RUN curl -fsSL https://raw.githubusercontent.com/filebrowser/get/master/get.sh | bash
RUN mv /usr/local/bin/filebrowser /filebrowser

## change workdir to /
WORKDIR /

## Entry Point
ADD entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh

CMD ["/entrypoint.sh"]
