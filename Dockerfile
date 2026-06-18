FROM hackinglab/alpine-base-hl:3.2
LABEL maintainer="Ivan Buetler <ivan.buetler@hacking-lab.com>"

ARG TTYD_REPO=https://github.com/tsl0922/ttyd.git
ARG TTYD_REF=

RUN set -eux; \
    apk add --no-cache \
        alpine-sdk \
        cmake \
        git \
        json-c-dev \
        libuv-dev \
        libwebsockets-dev \
        libwebsockets-evlib_uv \
        openssl-dev \
        zlib-dev; \
    if [ -n "$TTYD_REF" ]; then \
        git clone --branch "$TTYD_REF" --depth=1 "$TTYD_REPO" /ttyd; \
    else \
        git clone --depth=1 "$TTYD_REPO" /ttyd; \
    fi

COPY libwebsockets-config.cmake /usr/lib/cmake/libwebsockets/

RUN set -eux; \
    cmake -S /ttyd -B /ttyd/build; \
    cmake --build /ttyd/build; \
    cmake --install /ttyd/build; \
    rm -rf /ttyd

COPY root /

EXPOSE 7681
