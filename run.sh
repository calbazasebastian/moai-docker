#!/bin/bash
set -e

BRANCH=$1
if [ -z ${1+x} ]; then
	BRANCH=develop			 
fi

./submodule_branch.sh $BRANCH

TAG=moai/$BRANCH:$(cat moai-dev/moai.commit)

sudo docker run -ti  --net none -e "DISPLAY=unix:0.0" -v  /tmp/.X11-unix:/tmp/.X11-unix:ro --privileged $TAG $2  