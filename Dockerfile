FROM hackinglab/alpine-base-hl:3.2
MAINTAINER Ivan Buetler <ivan.buetler@compass-security.com>

RUN apk update && apk --no-cache add sudo alpine-sdk cmake zlib-dev libuv libuv-dev json-c json-c-dev libwebsockets libwebsockets-dev libwebsockets-evlib_uv openssl openssl-dev && \
    git clone --depth=1 https://github.com/tsl0922/ttyd.git /ttyd && \
    apk add cmake zlib-dev libuv libuv-dev json-c json-c-dev libwebsockets libwebsockets-dev && \
    cd /ttyd && mkdir build && cd build && \
    cmake .. && \
    make && sudo make install && \
    rm -rf /ttyd && \
    rm -rf /var/cache/apk/*

# Add the files
ADD root /

# Expose the ports for nginx
EXPOSE 7681


