#!/bin/bash
cp /Users/kaonpark/workspace/github.com/likejazz/likejazz.github.io.wiki/* public/
rm -rf public/_Footer.md
rm -rf public/_Sidebar.md
git add . && git commit -m "Publishing" && git push origin master
