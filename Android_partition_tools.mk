LOCAL_PATH := $(call my-dir)

##############################################################################
# libsparse
##############################################################################
include $(CLEAR_VARS)

LOCAL_MODULE := libsparse

LOCAL_C_INCLUDES := \
    src/system/core/libsparse/include \
    src/system/core/base/include \
    src/external/zlib

LOCAL_SRC_FILES += \
    src/system/core/libsparse/backed_block.cpp \
    src/system/core/libsparse/output_file.cpp \
    src/system/core/libsparse/sparse.cpp \
    src/system/core/libsparse/sparse_crc32.cpp \
    src/system/core/libsparse/sparse_err.cpp \
    src/system/core/libsparse/sparse_read.cpp

LOCAL_STATIC_LIBRARIES := z base

include $(BUILD_STATIC_LIBRARY)

##############################################################################
# libz
##############################################################################
include $(CLEAR_VARS)

LOCAL_MODULE := libz

LOCAL_CFLAGS := \
    -DHAVE_HIDDEN \
    -DZLIB_CONST \
    -DADLER32_SIMD_NEON

LOCAL_C_INCLUDES := \
    src/external/zlib

LOCAL_SRC_FILES += \
    src/external/zlib/adler32.c \
    src/external/zlib/compress.c \
    src/external/zlib/crc32.c \
    src/external/zlib/deflate.c \
    src/external/zlib/gzclose.c \
    src/external/zlib/gzlib.c \
    src/external/zlib/gzread.c \
    src/external/zlib/gzwrite.c \
    src/external/zlib/infback.c \
    src/external/zlib/inffast.c \
    src/external/zlib/inflate.c \
    src/external/zlib/inftrees.c \
    src/external/zlib/trees.c \
    src/external/zlib/uncompr.c \
    src/external/zlib/zutil.c \
    \
    src/external/zlib/adler32_simd.c \
    src/external/zlib/cpu_features.c \
    src/external/zlib/crc32_simd.c

include $(BUILD_STATIC_LIBRARY)

##############################################################################
# libbase
##############################################################################
include $(CLEAR_VARS)

LOCAL_MODULE := libbase

LOCAL_CXXFLAGS := \
    -std=c++17 \
    -stdlib=libc++static

LOCAL_CPPFLAGS := -D_FILE_OFFSET_BITS=64 -Wexit-time-destructors

LOCAL_C_INCLUDES := \
    src/system/libbase/include \
    src/system/core/include \
    src/system/libbase \
    src/system/core/liblog/include

LOCAL_SRC_FILES += \
    src/system/core/base/abi_compatibility.cpp \
    src/system/core/base/chrono_utils.cpp \
    src/system/core/base/cmsg.cpp \
    src/system/core/base/file.cpp \
    src/system/core/base/liblog_symbols.cpp \
    src/system/core/base/logging.cpp \
    src/system/core/base/mapped_file.cpp \
    src/system/core/base/parsebool.cpp \
    src/system/core/base/parsenetaddress.cpp \
    src/system/core/base/process.cpp \
    src/system/core/base/properties.cpp \
    src/system/core/base/stringprintf.cpp \
    src/system/core/base/strings.cpp \
    src/system/core/base/threads.cpp \
    src/system/core/base/test_utils.cpp \
    src/system/core/base/errors_unix.cpp

LOCAL_STATIC_LIBRARIES := log

include $(BUILD_STATIC_LIBRARY)

##############################################################################
# liblog
##############################################################################
include $(CLEAR_VARS)

LOCAL_MODULE := liblog

LOCAL_CXXFLAGS := \
    -std=c++17 \
    -fPIC \
    -stdlib=libc++static

LOCAL_CFLAGS := \
    -DSNET_EVENT_LOG_TAG=1397638484 \
    -DLIBLOG_LOG_TAG=1006

LOCAL_C_INCLUDES := \
    src/system/core/liblog \
    src/system/core/liblog/include \
    src/system/core/libcutils/include \
    src/system/core/libutils/include \
    src/system/core/libsystem/include \
    src/system/libbase/include \
    src/system/core/include \
    src/bionic/libc/include

LOCAL_SRC_FILES += \
    src/system/core/liblog/log_event_list.cpp \
    src/system/core/liblog/log_event_write.cpp \
    src/system/core/liblog/logger_name.cpp \
    src/system/core/liblog/logger_read.cpp \
    src/system/core/liblog/logger_write.cpp \
    src/system/core/liblog/logprint.cpp \
    src/system/core/liblog/properties.cpp \
    \
    src/system/core/liblog/log_time.cpp \
    src/system/core/liblog/pmsg_reader.cpp \
    src/system/core/liblog/pmsg_writer.cpp \
    src/system/core/liblog/logd_reader.cpp \
    src/system/core/liblog/logd_writer.cpp

include $(BUILD_STATIC_LIBRARY)

##############################################################################
# liblp
##############################################################################
include $(CLEAR_VARS)

LOCAL_MODULE := liblp

LOCAL_CXXFLAGS := \
    -std=c++17 \
    -stdlib=libc++static

LOCAL_CPPFLAGS := -D_FILE_OFFSET_BITS=64

LOCAL_C_INCLUDES := \
    $(NDK_ROOT)/sources/cxx-stl/llvm-libc++/include \
    src/system/core/fs_mgr/liblp \
    src/system/core/fs_mgr/liblp/include \
    src/system/core/base/include \
    src/system/core/include \
    src/system/core/libsparse/include \
    src/system/extras/ext4_utils/include \
    src/bionic/libc/include \
    src/boringssl/include
    
LOCAL_SRC_FILES := \
    src/system/core/fs_mgr/liblp/builder.cpp \
    src/system/core/fs_mgr/liblp/images.cpp \
    src/system/core/fs_mgr/liblp/partition_opener.cpp \
    src/system/core/fs_mgr/liblp/property_fetcher.cpp \
    src/system/core/fs_mgr/liblp/reader.cpp \
    src/system/core/fs_mgr/liblp/utility.cpp \
    src/system/core/fs_mgr/liblp/writer.cpp

LOCAL_STATIC_LIBRARIES := cutils ext4_utils sparse log base crypto_utils crypto z

include $(BUILD_STATIC_LIBRARY)

##############################################################################
# libcutils
##############################################################################
include $(CLEAR_VARS)

LOCAL_MODULE := libcutils

LOCAL_CFLAGS := \
    -DANDROID_HOST_BUILD \
    -Werror -Wall -Wextra -Wno-typedef-redefinition

LOCAL_CPPFLAGS := -std=c++17

LOCAL_C_INCLUDES := \
    src/bionic/libc/include \
    src/system/core/libprocessgroup/include \
    src/boringssl/third_party/googletest/include \
    src/system/core/base/include \
    src/system/core/libutils\include\utils \
    src/system/core/include/private \
    src/system/core/liblog/include \
    src/system/core/libcutils/include \
    src/system/core/include

LOCAL_SRC_FILES += \
    src/system/core/libcutils/config_utils.cpp \
    src/system/core/libcutils/canned_fs_config.cpp \
    src/system/core/libcutils/hashmap.cpp \
    src/system/core/libcutils/iosched_policy.cpp \
    src/system/core/libcutils/load_file.cpp \
    src/system/core/libcutils/klog.cpp \
    src/system/core/libcutils/native_handle.cpp \
    src/system/core/libcutils/record_stream.cpp \
    src/system/core/libcutils/sched_policy_test.cpp \
    src/system/core/libcutils/sockets.cpp \
    src/system/core/libcutils/strlcpy.c \
    src/system/core/libcutils/threads.cpp \
    \
    src/system/core/libcutils/android_get_control_file.cpp \
    src/system/core/libcutils/fs.cpp \
    src/system/core/libcutils/fs_config.cpp \
    src/system/core/libcutils/multiuser.cpp \
    src/system/core/libcutils/socket_inaddr_any_server_unix.cpp \
    src/system/core/libcutils/socket_local_client_unix.cpp \
    src/system/core/libcutils/socket_local_server_unix.cpp \
    src/system/core/libcutils/socket_network_client_unix.cpp \
    src/system/core/libcutils/sockets_unix.cpp \
    src/system/core/libcutils/str_parms.cpp \
    \
    src/system/core/libcutils/android_reboot.cpp \
    src/system/core/libcutils/ashmem-dev.cpp \
    src/system/core/libcutils/ashmem-host.cpp \
    src/system/core/libcutils/partition_utils.cpp \
    src/system/core/libcutils/properties.cpp \
    src/system/core/libcutils/qtaguid.cpp \
    src/system/core/libcutils/trace-dev.cpp \
    src/system/core/libcutils/uevent.cpp \
    src/system/core/libcutils/trace-host.cpp

ifeq ($(TARGET_ARCH_ABI),armeabi-v7a)
LOCAL_SRC_FILES += \
    src/system/core/libcutils/arch-arm/memset32.S
endif

ifeq ($(TARGET_ARCH_ABI),arm64-v8a)
LOCAL_SRC_FILES += \
    src/system/core/libcutils/arch-arm64/android_memset.S
endif

include $(BUILD_STATIC_LIBRARY)

##############################################################################
# libcrypto_utils
##############################################################################
include $(CLEAR_VARS)

LOCAL_MODULE := libcrypto_utils

LOCAL_C_INCLUDES := \
    src/system/core/libcrypto_utils/include \
    src/boringssl/include

LOCAL_SRC_FILES := \
    src/system/core/libcrypto_utils/android_pubkey.c

include $(BUILD_STATIC_LIBRARY)

##############################################################################
#libext4_utils
##############################################################################
include $(CLEAR_VARS)

LOCAL_MODULE := libext4_utils

LOCAL_CFLAGS := -fno-strict-aliasing

LOCAL_C_INCLUDES := \
    src/bionic/libc/include \
    src/system/extras/ext4_utils/include \
    src/system/core/libcutils/include \
    src/system/core/base/include \
    src/system/core/logwrapper/include \
    src/system/core/include \
    src/system/core/libkeyutils/include

LOCAL_SRC_FILES += \
    src/system/extras/ext4_utils/blk_alloc_to_base_fs.cpp \
    src/system/extras/ext4_utils/ext4_sb.cpp \
    src/system/extras/ext4_utils/ext4_utils.cpp \
    src/system/extras/ext4_utils/wipe.cpp

LOCAL_STATIC_LIBRARIES := selinux sparse

include $(BUILD_STATIC_LIBRARY)

##############################################################################
# libpcre
##############################################################################
include $(CLEAR_VARS)

LOCAL_MODULE := libpcre

LOCAL_CFLAGS := \
    -DHAVE_CONFIG_H \
    -Wno-self-assign \
    -Wno-unused-parameter

LOCAL_C_INCLUDES := \
    src/external/pcre/include \
    src/external/pcre/include_internal

LOCAL_SRC_FILES := \
    src/external/pcre/dist2/src/pcre2_auto_possess.c \
    src/external/pcre/dist2/src/pcre2_compile.c \
    src/external/pcre/dist2/src/pcre2_config.c \
    src/external/pcre/dist2/src/pcre2_context.c \
    src/external/pcre/dist2/src/pcre2_dfa_match.c \
    src/external/pcre/dist2/src/pcre2_error.c \
    src/external/pcre/dist2/src/pcre2_find_bracket.c \
    src/external/pcre/dist2/src/pcre2_maketables.c \
    src/external/pcre/dist2/src/pcre2_match.c \
    src/external/pcre/dist2/src/pcre2_match_data.c \
    src/external/pcre/dist2/src/pcre2_jit_compile.c \
    src/external/pcre/dist2/src/pcre2_newline.c \
    src/external/pcre/dist2/src/pcre2_ord2utf.c \
    src/external/pcre/dist2/src/pcre2_pattern_info.c \
    src/external/pcre/dist2/src/pcre2_serialize.c \
    src/external/pcre/dist2/src/pcre2_string_utils.c \
    src/external/pcre/dist2/src/pcre2_study.c \
    src/external/pcre/dist2/src/pcre2_substitute.c \
    src/external/pcre/dist2/src/pcre2_substring.c \
    src/external/pcre/dist2/src/pcre2_tables.c \
    src/external/pcre/dist2/src/pcre2_ucd.c \
    src/external/pcre/dist2/src/pcre2_valid_utf.c \
    src/external/pcre/dist2/src/pcre2_xclass.c \
    src/external/pcre/dist2/src/pcre2_chartables.c    

include $(BUILD_STATIC_LIBRARY)

##############################################################################
# libselinux
##############################################################################
include $(CLEAR_VARS)

LOCAL_MODULE := libselinux

LOCAL_CFLAGS := -DHOST -DUSE_PCRE2

LOCAL_C_INCLUDES := \
    src/external/selinux/libselinux/include \
    src/external/pcre/include

LOCAL_SRC_FILES := \
    src/external/selinux/libselinux/src/label_file.c \
    src/external/selinux/libselinux/src/regex.c \
    src/external/selinux/libselinux/src/android/android_host.c \
    src/external/selinux/libselinux/src/avc.c \
    src/external/selinux/libselinux/src/avc_internal.c \
    src/external/selinux/libselinux/src/avc_sidtab.c \
    src/external/selinux/libselinux/src/compute_av.c \
    src/external/selinux/libselinux/src/compute_create.c \
    src/external/selinux/libselinux/src/compute_member.c \
    src/external/selinux/libselinux/src/context.c \
    src/external/selinux/libselinux/src/enabled.c \
    src/external/selinux/libselinux/src/getenforce.c \
    src/external/selinux/libselinux/src/getfilecon.c \
    src/external/selinux/libselinux/src/get_initial_context.c \
    src/external/selinux/libselinux/src/init.c \
    src/external/selinux/libselinux/src/load_policy.c \
    src/external/selinux/libselinux/src/mapping.c \
    src/external/selinux/libselinux/src/procattr.c \
    src/external/selinux/libselinux/src/setexecfilecon.c \
    src/external/selinux/libselinux/src/stringrep.c

LOCAL_STATIC_LIBRARIES := pcre

include $(BUILD_STATIC_LIBRARY)

##############################################################################
# libcrypto
##############################################################################
include $(CLEAR_VARS)

LOCAL_MODULE := libcrypto

LOCAL_C_INCLUDES := src/boringssl/include

LOCAL_SRC_FILES := src/boringssl/dist/$(TARGET_ARCH_ABI)/libcrypto.a

include $(PREBUILT_STATIC_LIBRARY)

##############################################################################
# liblpdump
##############################################################################
include $(CLEAR_VARS)

LOCAL_MODULE := liblpdump

LOCAL_CXXFLAGS := \
    -std=c++17 \
    -stdlib=libc++static

LOCAL_C_INCLUDES := \
    src/system/core/fs_mgr/include_fstab \
    src/external/protobuf/src \
    src/system/libbase/include \
    src/system/core/include \
    src/system/core/fs_mgr/include \
    src/system/extras/libjsonpb/parse/include \
    src/system/core/fs_mgr/liblp/include \
    src/system/extras/partition_tools

LOCAL_SRC_FILES := \
    src/system/extras/partition_tools/lpdump.cc \
    src/system/extras/partition_tools/dynamic_partitions_device_info.pb.cc

LOCAL_STATIC_LIBRARIES := base log lp cutils fs_mgr jsonpbparse protobuf-cpp-full

include $(BUILD_STATIC_LIBRARY)

##############################################################################
# libjsonpbparse
##############################################################################
include $(CLEAR_VARS)

LOCAL_MODULE := libjsonpbparse

LOCAL_CXXFLAGS := \
    -std=c++17 \
    -stdlib=libc++static

LOCAL_C_INCLUDES := \
    src/system/extras/libjsonpb/parse/include \
    src/system/libbase/include \
    src/external/protobuf/src

LOCAL_SRC_FILES := \
    src/system/extras/libjsonpb/parse/jsonpb.cpp

LOCAL_STATIC_LIBRARIES := base protobuf-cpp-full

include $(BUILD_STATIC_LIBRARY)

##############################################################################
# libprotobuf-cpp-full
##############################################################################
include $(CLEAR_VARS)

LOCAL_MODULE := libprotobuf-cpp-full

LOCAL_CXXFLAGS := \
    -std=c++17 \
    -stdlib=libc++static \
    -Wno-unused-const-variable \
    -Wno-error=user-defined-warnings \
    -Wno-inconsistent-missing-override

LOCAL_CFLAGS := \
    -DHAVE_ZLIB=1 \
    -Wall \
    -Werror \
    -Wno-unused-function \
    -Wno-sign-compare \
    -Wno-unused-parameter \
    -Wno-sign-promo

LOCAL_C_INCLUDES := \
    src/external/protobuf/android \
    src/external/protobuf/src

LOCAL_SRC_FILES := \
    src/external/protobuf/src/google/protobuf/any_lite.cc \
    src/external/protobuf/src/google/protobuf/arena.cc \
    src/external/protobuf/src/google/protobuf/extension_set.cc \
    src/external/protobuf/src/google/protobuf/generated_enum_util.cc \
    src/external/protobuf/src/google/protobuf/generated_message_table_driven_lite.cc \
    src/external/protobuf/src/google/protobuf/generated_message_util.cc \
    src/external/protobuf/src/google/protobuf/implicit_weak_message.cc \
    src/external/protobuf/src/google/protobuf/io/coded_stream.cc \
    src/external/protobuf/src/google/protobuf/io/io_win32.cc \
    src/external/protobuf/src/google/protobuf/io/strtod.cc \
    src/external/protobuf/src/google/protobuf/io/zero_copy_stream.cc \
    src/external/protobuf/src/google/protobuf/io/zero_copy_stream_impl.cc \
    src/external/protobuf/src/google/protobuf/io/zero_copy_stream_impl_lite.cc \
    src/external/protobuf/src/google/protobuf/message_lite.cc \
    src/external/protobuf/src/google/protobuf/parse_context.cc \
    src/external/protobuf/src/google/protobuf/repeated_field.cc \
    src/external/protobuf/src/google/protobuf/stubs/bytestream.cc \
    src/external/protobuf/src/google/protobuf/stubs/common.cc \
    src/external/protobuf/src/google/protobuf/stubs/int128.cc \
    src/external/protobuf/src/google/protobuf/stubs/status.cc \
    src/external/protobuf/src/google/protobuf/stubs/statusor.cc \
    src/external/protobuf/src/google/protobuf/stubs/stringpiece.cc \
    src/external/protobuf/src/google/protobuf/stubs/stringprintf.cc \
    src/external/protobuf/src/google/protobuf/stubs/structurally_valid.cc \
    src/external/protobuf/src/google/protobuf/stubs/strutil.cc \
    src/external/protobuf/src/google/protobuf/stubs/time.cc \
    src/external/protobuf/src/google/protobuf/wire_format_lite.cc \
    \
    src/external/protobuf/src/google/protobuf/any.cc \
    src/external/protobuf/src/google/protobuf/any.pb.cc \
    src/external/protobuf/src/google/protobuf/api.pb.cc \
    src/external/protobuf/src/google/protobuf/compiler/importer.cc \
    src/external/protobuf/src/google/protobuf/compiler/parser.cc \
    src/external/protobuf/src/google/protobuf/descriptor.cc \
    src/external/protobuf/src/google/protobuf/descriptor.pb.cc \
    src/external/protobuf/src/google/protobuf/descriptor_database.cc \
    src/external/protobuf/src/google/protobuf/duration.pb.cc \
    src/external/protobuf/src/google/protobuf/dynamic_message.cc \
    src/external/protobuf/src/google/protobuf/empty.pb.cc \
    src/external/protobuf/src/google/protobuf/extension_set_heavy.cc \
    src/external/protobuf/src/google/protobuf/field_mask.pb.cc \
    src/external/protobuf/src/google/protobuf/generated_message_reflection.cc \
    src/external/protobuf/src/google/protobuf/generated_message_table_driven.cc \
    src/external/protobuf/src/google/protobuf/io/gzip_stream.cc \
    src/external/protobuf/src/google/protobuf/io/printer.cc \
    src/external/protobuf/src/google/protobuf/io/tokenizer.cc \
    src/external/protobuf/src/google/protobuf/map_field.cc \
    src/external/protobuf/src/google/protobuf/message.cc \
    src/external/protobuf/src/google/protobuf/reflection_ops.cc \
    src/external/protobuf/src/google/protobuf/service.cc \
    src/external/protobuf/src/google/protobuf/source_context.pb.cc \
    src/external/protobuf/src/google/protobuf/struct.pb.cc \
    src/external/protobuf/src/google/protobuf/stubs/mathlimits.cc \
    src/external/protobuf/src/google/protobuf/stubs/substitute.cc \
    src/external/protobuf/src/google/protobuf/text_format.cc \
    src/external/protobuf/src/google/protobuf/timestamp.pb.cc \
    src/external/protobuf/src/google/protobuf/type.pb.cc \
    src/external/protobuf/src/google/protobuf/unknown_field_set.cc \
    src/external/protobuf/src/google/protobuf/util/delimited_message_util.cc \
    src/external/protobuf/src/google/protobuf/util/field_comparator.cc \
    src/external/protobuf/src/google/protobuf/util/field_mask_util.cc \
    src/external/protobuf/src/google/protobuf/util/internal/datapiece.cc \
    src/external/protobuf/src/google/protobuf/util/internal/default_value_objectwriter.cc \
    src/external/protobuf/src/google/protobuf/util/internal/error_listener.cc \
    src/external/protobuf/src/google/protobuf/util/internal/field_mask_utility.cc \
    src/external/protobuf/src/google/protobuf/util/internal/json_escaping.cc \
    src/external/protobuf/src/google/protobuf/util/internal/json_objectwriter.cc \
    src/external/protobuf/src/google/protobuf/util/internal/json_stream_parser.cc \
    src/external/protobuf/src/google/protobuf/util/internal/object_writer.cc \
    src/external/protobuf/src/google/protobuf/util/internal/proto_writer.cc \
    src/external/protobuf/src/google/protobuf/util/internal/protostream_objectsource.cc \
    src/external/protobuf/src/google/protobuf/util/internal/protostream_objectwriter.cc \
    src/external/protobuf/src/google/protobuf/util/internal/type_info.cc \
    src/external/protobuf/src/google/protobuf/util/internal/type_info_test_helper.cc \
    src/external/protobuf/src/google/protobuf/util/internal/utility.cc \
    src/external/protobuf/src/google/protobuf/util/json_util.cc \
    src/external/protobuf/src/google/protobuf/util/message_differencer.cc \
    src/external/protobuf/src/google/protobuf/util/time_util.cc \
    src/external/protobuf/src/google/protobuf/util/type_resolver_util.cc \
    src/external/protobuf/src/google/protobuf/wire_format.cc \
    src/external/protobuf/src/google/protobuf/wrappers.pb.cc

LOCAL_STATIC_LIBRARIES := z log

include $(BUILD_STATIC_LIBRARY)

#############################################################################
# libfs_mgr
#############################################################################
include $(CLEAR_VARS)

LOCAL_MODULE := libfs_mgr

LOCAL_CXXFLAGS := \
    -std=c++17 \
    -stdlib=libc++static \
    -Wno-macro-redefined \
    -Wno-inconsistent-missing-override

LOCAL_CFLAGS := -D_FILE_OFFSET_BITS=64

LOCAL_CPPFLAGS := -DALLOW_ADBD_DISABLE_VERITY=0

LOCAL_C_INCLUDES := \
    src/system/extras/ext4_utils/include \
    src/system/core/fs_mgr/include \
    src/system/libbase/include \
    src/system/core/fs_mgr/include_fstab \
    src/system/core/include \
    src/system/core/fs_mgr/libfs_avb/include \
    src/external/avb \
    src/system/extras/libfscrypt/include \
    src/system/core/fs_mgr/libdm/include \
    src/system/core/fs_mgr/liblp/include \
    src/system/core/logwrapper/include \
    src/system/vold \
    src/system/extras/libfec/include \
    src/bionic/libc/kernel/uapi \
    src/bionic/libc/include \
    src/external/selinux/libselinux/include \
    src/system/core/libcrypto_utils/include \
    src/boringssl/include \
    src/system/core/fs_mgr \
    src/system/core/fs_mgr/libfiemap/include \
    src/system/gsid/include \
    src/system/core/fs_mgr/libstorage_literals

LOCAL_SRC_FILES := \
    src/system/core/fs_mgr/file_wait.cpp \
    src/system/core/fs_mgr/fs_mgr.cpp \
    src/system/core/fs_mgr/fs_mgr_format.cpp \
    src/system/core/fs_mgr/fs_mgr_verity.cpp \
    src/system/core/fs_mgr/fs_mgr_dm_linear.cpp \
    src/system/core/fs_mgr/fs_mgr_overlayfs.cpp \
    src/system/core/fs_mgr/fs_mgr_roots.cpp \
    src/system/core/fs_mgr/fs_mgr_vendor_overlay.cpp

LOCAL_STATIC_LIBRARIES := base crypto cutils ext4_utils lp log selinux crypto_utils fec fstab

include $(BUILD_STATIC_LIBRARY)

##############################################################################
# libfstab
##############################################################################
include $(CLEAR_VARS)

LOCAL_MODULE := libfstab

LOCAL_CXXFLAGS := \
    -std=c++17 \
    -stdlib=libc++static

LOCAL_C_INCLUDES := \
    src/system/libbase/include \
    src/system/gsid/include \
    src/system/core/fs_mgr/include \
    src/system/core/fs_mgr/include_fstab

LOCAL_SRC_FILES := \
    src/system/core/fs_mgr/fs_mgr_fstab.cpp \
    src/system/core/fs_mgr/fs_mgr_boot_config.cpp \
    src/system/core/fs_mgr/fs_mgr_slotselect.cpp

include $(BUILD_STATIC_LIBRARY)

##############################################################################
# libfec
##############################################################################
include $(CLEAR_VARS)

LOCAL_MODULE := libfec

LOCAL_CXXFLAGS := \
    -std=c++17 \
    -stdlib=libc++static

LOCAL_CFLAGS := \
    -O3 \
    -D_LARGEFILE64_SOURCE \
    -D_GNU_SOURCE \
    -DFEC_NO_KLOG

LOCAL_C_INCLUDES := \
    src/system/extras/libfec/include \
    src/system/extras/ext4_utils/include \
    src/system/extras/squashfs_utils \
    src/system/core/libcrypto_utils/include \
    src/boringssl/include \
    src/system/core/include \
    src/external/fec \
    src/system/libbase/include

LOCAL_SRC_FILES := \
    src/system/extras/libfec/fec_open.cpp \
    src/system/extras/libfec/fec_read.cpp \
    src/system/extras/libfec/fec_verity.cpp \
    src/system/extras/libfec/fec_process.cpp

LOCAL_STATIC_LIBRARIES := base crypto crypto_utils cutils ext4_utils

include $(BUILD_STATIC_LIBRARY)

##############################################################################
# lpunpack
##############################################################################
include $(CLEAR_VARS)

LOCAL_MODULE := lpunpack

LOCAL_CFLAGS := \
    -Werror \
    -Wextra

LOCAL_LDFLAGS := -fPIE -static

LOCAL_CPPFLAGS := -D_FILE_OFFSET_BITS=64

LOCAL_CXXFLAGS := \
    -std=c++17 \
    -stdlib=libc++static

LOCAL_C_INCLUDES := \
    $(NDK_ROOT)/sources/cxx-stl/llvm-libc++/include \
    src/bionic/libc/include \
    src/system/core/base/include \
    src/system/core/fs_mgr/liblp/include \
    src/system/core/libsparse/include

LOCAL_SRC_FILES := src/system/extras/partition_tools/lpunpack.cc

LOCAL_STATIC_LIBRARIES := sparse base log lp

include $(BUILD_EXECUTABLE)

##############################################################################
# lpmake
##############################################################################
include $(CLEAR_VARS)

LOCAL_MODULE := lpmake

LOCAL_CFLAGS := \
    -Werror \
    -Wextra

LOCAL_LDFLAGS := -fPIE -static

LOCAL_CXXFLAGS := \
    -std=c++17 \
    -stdlib=libc++static

LOCAL_C_INCLUDES := \
    $(NDK_ROOT)/sources/cxx-stl/llvm-libc++/include \
    src/bionic/libc/include \
    src/system/core/base/include \
    src/system/core/fs_mgr/liblp/include

LOCAL_SRC_FILES := src/system/extras/partition_tools/lpmake.cc

LOCAL_LDLIBS += -lz

LOCAL_STATIC_LIBRARIES := base log lp

include $(BUILD_EXECUTABLE)

##############################################################################
# lpflash
##############################################################################
include $(CLEAR_VARS)

LOCAL_MODULE := lpflash

LOCAL_CFLAGS := \
    -Werror \
    -Wextra

LOCAL_LDFLAGS := -fPIE -static

LOCAL_CXXFLAGS := \
    -std=c++17 \
    -stdlib=libc++static

LOCAL_C_INCLUDES := \
    $(NDK_ROOT)/sources/cxx-stl/llvm-libc++/include \
    src/bionic/libc/include \
    src/system/core/base/include \
    src/system/core/fs_mgr/liblp/include

LOCAL_SRC_FILES := src/system/extras/partition_tools/lpflash.cc

LOCAL_STATIC_LIBRARIES := base log lp

include $(BUILD_EXECUTABLE)

##############################################################################
# lpadd
##############################################################################
include $(CLEAR_VARS)

LOCAL_MODULE := lpadd

LOCAL_LDFLAGS := -fPIE -static

LOCAL_CXXFLAGS := \
    -std=c++17 \
    -stdlib=libc++static

LOCAL_C_INCLUDES := \
    src/system/core/base/include \
    src/system/core/fs_mgr/liblp/include \
    src/system/core/libsparse/include

LOCAL_SRC_FILES := src/system/extras/partition_tools/lpadd.cc

LOCAL_STATIC_LIBRARIES := sparse base log lp

include $(BUILD_EXECUTABLE)

##############################################################################
# lpdump
##############################################################################
include $(CLEAR_VARS)

LOCAL_MODULE := lpdump_binary

LOCAL_LDFLAGS := -fPIE -static

LOCAL_CXXFLAGS := \
    -std=c++17 \
    -stdlib=libc++static

LOCAL_C_INCLUDES := \
    $(NDK_ROOT)/sources/cxx-stl/llvm-libc++/include \
    src/bionic/libc/include \
    src/system/core/base/include \
    src/system/core/fs_mgr/liblp/include

LOCAL_SRC_FILES := \
    src/system/extras/partition_tools/lpdump_host.cc

LOCAL_STATIC_LIBRARIES := base log lp lpdump protobuf-cpp-full

include $(BUILD_EXECUTABLE)
