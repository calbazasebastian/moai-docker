#!/bin/bash
set -e

BRANCH=$1
if [ -z ${1+x} ]; then
	BRANCH=develop			 
fi

./submodule_branch.sh $BRANCH

TAG=moai/$BRANCH:$(cat moai-dev/moai.commit)

sudo docker  build -t $TAG .
