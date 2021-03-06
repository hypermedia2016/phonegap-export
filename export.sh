#!/usr/bin/env bash


OLD_DIR=${PWD}
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

trap 'cd $OLD_DIR' 0

## clone repository
rm -Rf git/web
git clone https://github.com/hypermedia2016/web.git git/web

## cd website & install decencies
cd git/web/WEBSITE
npm install
gulp --production


## cd root & copy files
cd ../../../
rm -rf img
cp -R git/web/WEBSITE/public/* .


## remove useless
rm -Rf api
rm -Rf img/dynamic

## done
echo "Export executed, check if programs called have generated errors"