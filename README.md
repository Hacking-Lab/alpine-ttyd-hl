# alpine-ttyd-hl
Alpine Docker image with ttyd for Hacking-Lab challenges.

This image extends `hackinglab/alpine-base-hl:3.2`, so it inherits:

* s6-overlay startup handling
* dynamic Hacking-Lab user creation
* optional root and user passwords from environment variables
* dynamic CTF flag handling from environment variables or `/goldnugget/*.gn`

## Usage

```bash
docker compose up --build
```

The default compose file exposes ttyd on http://localhost:7681 and creates a
`hacker` user with the password `compass`.

## Configuration

You can configure the challenge user with these environment variables:

* `HL_USER_USERNAME=hacker`
* `HL_USER_PASSWORD=compass`
* `HL_ROOT_PASSWORD=change-me`
* `GOLDNUGGET=FLAG{myflag}`

## Build

```bash
docker build -t hackinglab/alpine-ttyd-hl:3.2 .
```

To build ttyd from a specific upstream branch, tag, or commit:

```bash
docker build --build-arg TTYD_REF=<ref> -t hackinglab/alpine-ttyd-hl:3.2 .
```

For multi-architecture releases:

```bash
./build-multi-arch.sh 3.2
```

## Notes

* libwebsockets without `-DLWS_WITH_LIBUV=ON` breaks the ttyd package.
* This image ships a libwebsockets CMake config workaround for `libwebsockets context creation failed`.


Acknowledgment libwebsocket solution
* fix is based on https://github.com/matti/docker-alpine-libwebsockets-with-libuv

Acknowledgment ttyd 
* https://github.com/tsl0922/ttyd
