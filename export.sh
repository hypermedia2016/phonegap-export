#!/usr/bin/env bash


OLD_DIR=${PWD}
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

trap 'cd $OLD_DIR' 0

## clone repository
git clone https://github.com/hypermedia2016/web.git git/web

## cd website & install decencies
cd git/web/WEBSITE
npm install
gulp --production


## cd root & copy files
cd ../../../
cp git/web/WEBSITE/public .

## done
echo "Export executed, check if programs called have generated errors"