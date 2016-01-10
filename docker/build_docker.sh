#!/bin/bash
# verbose/exit on error
set -xe
docker build -t mozilla/heka_base $(dirname $0)/..
docker build --rm -t mozilla/heka_build $(dirname $0)
docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -ti mozilla/heka_build
docker rmi mozilla/heka_build
