#!/bin/bash

GITHUB_PATH=/Users/kaonpark/workspace/github.com/likejazz

# Wiki publishing
echo "-------------------------"
echo "Wiki Publishing"
echo "-------------------------"
cd ${GITHUB_PATH}/likejazz.github.io.wiki
git commit -a -m "Publishing" && git push origin master

# Github.io publishing
echo "-------------------------"
echo "Github.io Publishing"
echo "-------------------------"
cd ${GITHUB_PATH}/likejazz.github.io
git add . && git commit -m "Publishing" && git push origin master
