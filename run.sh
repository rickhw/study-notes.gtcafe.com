#! /bin/bash

source mkdocs_config.sh

docker pull $MKDOCS_IMAGE

(sleep 5 && {
  echo -e "${COLOR_GREEN}=========================================="
  echo -e "${COLOR_GREEN}使用完畢請記得按下 CTRL-C 關閉 container。"
  echo -e "${COLOR_GREEN}=========================================="
  echo -e "${COLOR_NONE}"
}) &

docker run --rm \
  -v $PWD:/docs-src \
  -p $PORT:$PORT \
  $MKDOCS_IMAGE
