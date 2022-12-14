#!/bin/bash

set -ex

cd "${0%/*}"

BASE_IMAGE=${1:-debian\:bullseye}
CONT=$(buildah from ${BASE_IMAGE})

buildah copy $CONT etc/ /etc
buildah copy $CONT root/ /root
buildah copy $CONT setup/ /setup
buildah run $CONT /bin/bash /setup/setup.sh
buildah run $CONT rm -rf /setup

buildah config --author "Alexander Veit" $CONT
buildah config --label commit=$(git describe --always --tags --dirty=-dirty) $CONT

buildah config --env LANG='en_US.UTF-8' $CONT
buildah config --env LANGUAGE='en_US:en' $CONT
buildah config --env LC_ALL='en_US.UTF-8' $CONT
buildah config --cmd '/bin/bash' $CONT
buildah config --workingdir '/qsk' $CONT

buildah commit --rm $CONT localhost/build-deb-${BASE_IMAGE}

