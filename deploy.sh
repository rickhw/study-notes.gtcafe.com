#!/bin/bash

source mkdocs_config.sh

git status
git add .
git commit -m "update on $TS, comment: ${DESC}"
git push origin master



