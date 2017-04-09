#!/bin/bash

GITHUB_PATH=/Users/kaonpark/workspace/github.com/likejazz

# Wiki publishing
echo "-------------------------"
echo "Wiki Publishing"
echo "-------------------------"
cd ${GITHUB_PATH}/likejazz.github.io.wiki
git pull
git status

# jupyter-notebooks publishing
echo "-----------------------------"
echo "jupyter-notebooks Publishing"
echo "-----------------------------"
cd ${GITHUB_PATH}/jupyter-notebooks
git pull
git status

# Github.io publishing
echo "-------------------------"
echo "Github.io Publishing"
echo "-------------------------"
cd ${GITHUB_PATH}/likejazz.github.io
git pull
git status

read -p "Press any key to continue."

# Publishing
cd ${GITHUB_PATH}/likejazz.github.io.wiki
git commit -a -m "Publishing" && git push origin master

cd ${GITHUB_PATH}/jupyter-notebooks
git add . && git commit -m "Publishing" && git push origin master

cd ${GITHUB_PATH}/likejazz.github.io
git add . && git commit -m "Publishing" && git push origin master