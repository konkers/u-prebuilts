#!/bin/bash

source $(dirname "$0")/_lib.sh

LLVM_URL="https://github.com/llvm-mirror/llvm.git"
LLVM_REF="db4a46b079d203a832a5229f073d5ffe124b5311"
CLANG_URL="https://github.com/llvm-mirror/clang.git"
CLANG_REF="76e835515565011fa4000791096a2953f54aafed"

BUILD_DIR=$(builddir clang)
PREBUILT_DIR=$(prebuiltdir clang)

mkdir -p ${BUILD_DIR}
cd ${BUILD_DIR}

git clone ${LLVM_URL}
cd llvm
git checkout ${LLVM_REF}

cd tools
git clone ${CLANG_URL}
cd clang
git checkout ${CLANG_REF}

cd ${BUILD_DIR}

mkdir build
cd build

cmake -G Ninja -DCMAKE_INSTALL_PREFIX=${PREBUILT_DIR} \
    -DCMAKE_BUILD_TYPE=Release -DLLVM_LINK_LLVM_DYLIB=ON ../llvm

cmake --build .

cmake --build . --target install
