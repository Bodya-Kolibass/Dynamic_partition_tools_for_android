#!/bin/sh

NDK=android-ndk-r21d-linux-x86_64
wget -c https://dl.google.com/android/repository/$NDK.zip
unzip -o $NDK.zip
rm -f $NDK.zip
