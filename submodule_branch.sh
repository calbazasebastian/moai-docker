#!/bin/bash
set -e


git submodule init 
git submodule  --quiet foreach "	
		git fetch ;
		git checkout --detach origin/$1 ;
		git rev-parse --short=12  origin/$1 > moai.commit 2>&1;	
"
