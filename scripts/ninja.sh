source $(dirname "$0")/_lib.sh

NINJA_URL="https://github.com/ninja-build/ninja.git"
NINJA_REF="v1.7.2"

BUILD_DIR=$(builddir ninja)
PREBUILT_DIR=$(prebuiltdir ninja)

mkdir -p ${BUILD_DIR}
cd ${BUILD_DIR}

git clone ${NINJA_URL}
cd ninja
git checkout ${NINJA_REF}

./configure.py --bootstrap

mkdir -p ${PREBUILT_DIR}/bin

cp ninja ${PREBUILT_DIR}/bin
