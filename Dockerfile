FROM debian:stable-slim

## Some utilities
RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
        apt-get install -y curl git tar fuse s3fs

RUN curl -fsSL https://raw.githubusercontent.com/filebrowser/get/master/get.sh | bash
RUN mv /usr/local/bin/filebrowser /filebrowser

## change workdir to /
WORKDIR /

## Entry Point
ADD entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh

CMD ["/entrypoint.sh"]
