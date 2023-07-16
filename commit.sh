#!/bin/sh

source mkdocs_config.sh

DESC=$1

# git pull origin master
git add .
git commit -m "update on $TS, comment: ${DESC}"
git push -u origin main

