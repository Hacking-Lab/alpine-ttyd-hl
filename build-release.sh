#!/bin/bash

docker build --no-cache -t hackinglab/alpine-ttyd:$1.0 -t hackinglab/alpine-ttyd:$1 -t hackinglab/alpine-ttyd:latest -f Dockerfile .

docker push hackinglab/alpine-ttyd
docker push hackinglab/alpine-ttyd:$1
docker push hackinglab/alpine-ttyd:$1.0

