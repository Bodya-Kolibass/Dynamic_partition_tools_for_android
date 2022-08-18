#!/bin/sh

clone() {
  repo=$1
  git clone -b platform-tools-33.0.1 https://android.googlesource.com/platform/$repo src/$repo
}

mkdir src

mkdir src/system
clone system/core
clone system/vold
clone system/gsid
clone system/extras
clone system/libbase
clone system/logging

mkdir src/external
clone external/avb
clone external/e2fsprogs
clone external/fec
clone external/fmtlib
clone external/selinux
clone external/squashfs-tools
clone external/pcre
clone external/protobuf
clone external/zlib

git clone https://boringssl.googlesource.com/boringssl src/boringssl
