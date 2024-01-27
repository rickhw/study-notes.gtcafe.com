#! /bin/bash

source mkdocs_config.sh

#mv docs docs.bak_${TS}
rm -rf docs/${VERSION}

mkdir -p docs/${VERSION}

docker run --rm -v $PWD/src:/docs/${VERSION} $MKDOCS_IMAGE build

mv src/site docs/${VERSION}



cp src/CNAME docs/
