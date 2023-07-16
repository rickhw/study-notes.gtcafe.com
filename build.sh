#! /bin/bash

source mkdocs_config.sh

docker run --rm -v $PWD:/docs $MKDOCS_IMAGE build
