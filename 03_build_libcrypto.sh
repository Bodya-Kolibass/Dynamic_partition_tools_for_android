#!/bin/sh

ROOT_DIR=`pwd`/src/boringssl
DIST_DIR=$ROOT_DIR/dist
BUILD_DIR=$ROOT_DIR/build

ABIS="armeabi-v7a arm64-v8a"

export ANDROID_NDK=$(pwd)/android-ndk-r24

build_shared() {
  arch=$1
  rm -rf $BUILD_DIR
  mkdir $BUILD_DIR
  cd $BUILD_DIR
  cmake -DANDROID_ABI=$arch \
      -DCMAKE_TOOLCHAIN_FILE=$ANDROID_NDK/build/cmake/android.toolchain.cmake \
      -DANDROID_NATIVE_API_LEVEL=30 \
      -DBUILD_SHARED_LIBS=1 \
      -GNinja ..
  ninja
  if [ ! -d $DIST_DIR/$arch ]; then
    mkdir -p $DIST_DIR/$arch
  fi
  cp $BUILD_DIR/crypto/libcrypto.so $DIST_DIR/$arch
  cp $BUILD_DIR/decrepit/libdecrepit.so $DIST_DIR/$arch
  cp $BUILD_DIR/ssl/libssl.so $DIST_DIR/$arch
}

build_static() {
  arch=$1
  rm -rf $BUILD_DIR
  mkdir $BUILD_DIR
  cd $BUILD_DIR
  cmake -DANDROID_ABI=$arch \
      -DCMAKE_TOOLCHAIN_FILE=$ANDROID_NDK/build/cmake/android.toolchain.cmake \
      -DANDROID_NATIVE_API_LEVEL=30 \
      -GNinja ..
  ninja
  if [ ! -d $DIST_DIR/$arch ]; then
    mkdir -p $DIST_DIR/$arch
  fi
  cp $BUILD_DIR/crypto/libcrypto.a $DIST_DIR/$arch
  cp $BUILD_DIR/decrepit/libdecrepit.a $DIST_DIR/$arch
  cp $BUILD_DIR/ssl/libssl.a $DIST_DIR/$arch
}

cd $ROOT_DIR
for arch in $ABIS
do
  build_shared $arch
  build_static $arch
done

cd ../../..
