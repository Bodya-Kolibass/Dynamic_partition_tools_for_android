#!/bin/sh

clone() {
  repo=$1
  git clone -b platform-tools-30.0.2 https://android.googlesource.com/platform/$repo src/$repo
}

mkdir src

mkdir src/system
clone system/core
clone system/vold
clone system/gsid
clone system/extras
clone system/libbase

mkdir src/bionic
clone bionic

mkdir src/external
clone external/avb
clone external/fec
clone external/selinux
clone external/pcre
clone external/protobuf
clone external/zlib

git clone https://boringssl.googlesource.com/boringssl src/boringssl
