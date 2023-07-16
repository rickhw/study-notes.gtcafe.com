#! /bin/bash

source mkdocs_config.sh

#mv docs docs.bak_${TS}
rm -rf docs

docker run --rm -v $PWD/src:/docs $MKDOCS_IMAGE build

mv src/site docs
