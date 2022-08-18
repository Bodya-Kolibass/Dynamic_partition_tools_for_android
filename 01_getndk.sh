#!/bin/sh

NDK=android-ndk-r24-linux
wget -c https://dl.google.com/android/repository/$NDK.zip
unzip -o $NDK.zip
rm -f $NDK.zip
