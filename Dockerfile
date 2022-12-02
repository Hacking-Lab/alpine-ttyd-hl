FROM hackinglab/alpine-base-hl:3.2
MAINTAINER Ivan Buetler <ivan.buetler@compass-security.com>


RUN apk update && apk --no-cache add sudo alpine-sdk cmake zlib-dev libuv libuv-dev json-c json-c-dev libwebsockets libwebsockets-dev libwebsockets-evlib_uv openssl openssl-dev && \
    git clone --depth=1 https://github.com/tsl0922/ttyd.git /ttyd

ADD libwebsockets-config.cmake /usr/lib/cmake/libwebsockets/

RUN cd /ttyd && mkdir build && cd build && \
    cmake .. && \
    make && sudo make install
    
ADD root /

EXPOSE 7681


