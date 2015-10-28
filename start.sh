#!/bin/bash
set -e

BRANCH=$1
if [ -z ${1+x} ]; then
	BRANCH=develop			 
fi

git submodule init 
git submodule  --quiet foreach "	
		git fetch ;
		git checkout --detach origin/$BRANCH ;
		git rev-parse --short=12  origin/$BRANCH > moai.commit 2>&1;	
"

TAG=moai/$BRANCH:$(cat moai-dev/moai.commit)
sudo docker  build -t $TAG .
sudo docker run -ti  --net none -e "DISPLAY=unix:0.0" -v  /tmp/.X11-unix:/tmp/.X11-unix:ro --privileged $TAG