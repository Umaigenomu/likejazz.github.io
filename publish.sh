#!/bin/bash

GITHUB_PATH=/Users/kaonpark/workspace/github.com/likejazz

# Wiki publishing
cd ${GITHUB_PATH}/likejazz.github.io.wiki
git commit -a -m "Publishing" && git push origin master

# Github.io publishing
cd ${GITHUB_PATH}/likejazz.github.io
git add . && git commit -m "Publishing" && git push origin master
