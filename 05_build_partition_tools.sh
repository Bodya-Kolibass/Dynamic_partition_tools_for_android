#!/bin/sh

export PATH=$PATH:$(pwd)/android-ndk-r21d
ndk-build NDK_PROJECT_PATH=. NDK_APP_LIBS_OUT=dist/partition_tools NDK_APPLICATION_MK=Application_partition_tools.mk $@
