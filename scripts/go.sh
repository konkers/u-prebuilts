source $(dirname "$0")/_lib.sh

GOLANG_URL="https://github.com/golang/go.git"
GOLANG_REF="go1.7.5"

BUILD_DIR=$(builddir go)
PREBUILT_DIR=$(prebuiltdir go)

eval $(go env | grep GOROOT | sed s/GOROOT/GOROOT_BOOTSTRAP/)

mkdir -p ${BUILD_DIR}
cd ${BUILD_DIR}

git clone ${GOLANG_URL}
cd go
git checkout ${GOLANG_REF}

cd src

GOROOT_BOOTSTRAP=${GOROOT_BOOTSTRAP} ./all.bash

mkdir -p ${PREBUILT_DIR}

cd ${BUILD_DIR}/go

cp -a * ${PREBUILT_DIR}
