#!/bin/sh

cd src/external/protobuf
./autogen.sh
./configure --with-protoc=protoc
make
cd ../../..
./src/external/protobuf/src/protoc src/system/extras/partition_tools/dynamic_partitions_device_info.proto --cpp_out=.
