#!/bin/bash

GITHUB_PATH=/Users/kaonpark/workspace/github.com/likejazz

# Wiki publishing
cd ${GITHUB_PATH}/likejazz.github.io.wiki
git commit -a -m "Publishing" && git push origin master

# Copy wiki docs to main repository and remove unnecessary files.
rm -rf ${GITHUB_PATH}/likejazz.github.io/public/*.md
cp * ${GITHUB_PATH}/likejazz.github.io/public/
cd ${GITHUB_PATH}/likejazz.github.io/public
rm -rf _Sidebar.md _Footer.md

# Github.io publishing
cd ..
git add . && git commit -m "Publishing" && git push origin master
