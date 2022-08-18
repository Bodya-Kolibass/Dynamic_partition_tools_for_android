LOCAL_PATH := $(call my-dir)

##############################################################################
# libz
##############################################################################
include $(CLEAR_VARS)

LOCAL_MODULE := libz

LOCAL_C_INCLUDES := \
    src/external/zlib

LOCAL_CFLAGS := \
	-DHAVE_HIDDEN \
	-DZLIB_CONST \
	-O3 \
	-Wall \
	-Werror \
	-Wno-unused \
	-Wno-unused-parameter \
	-DARMV8_OS_LINUX \
	-DADLER32_SIMD_NEON

LOCAL_SRC_FILES += \
	src/external/zlib/adler32.c \
	src/external/zlib/compress.c \
	src/external/zlib/cpu_features.c \
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
	src/external/zlib/crc32_simd.c

include $(BUILD_STATIC_LIBRARY)

##############################################################################
# libfmtlib
##############################################################################
include $(CLEAR_VARS)

LOCAL_MODULE := libfmtlib

LOCAL_C_INCLUDES := \
	src/external/fmtlib/include

LOCAL_CFLAGS := \
	-fno-exceptions \
	-UNDEBUG

LOCAL_SRC_FILES += \
	src/external/fmtlib/src/format.cc

LOCAL_EXPORT_C_INCLUDE_DIRS := \
	src/external/fmtlib/include

include $(BUILD_STATIC_LIBRARY)

##############################################################################
# liblog
##############################################################################
include $(CLEAR_VARS)

LOCAL_MODULE := liblog

LOCAL_C_INCLUDES := \
	src/system/logging/liblog \
	src/system/logging/liblog/include \
	src/system/core/libcutils/include \
	src/system/libbase/include \
	src/system/core/include

LOCAL_CFLAGS := \
	-Wall \
	-Werror \
	-Wextra \
	-Wexit-time-destructors \
	-DSNET_EVENT_LOG_TAG=1397638484 \
	-DLIBLOG_LOG_TAG=1006 \
	-Wno-c99-designator \
	-U__ANDROID__

LOCAL_CXXFLAGS := \
	-std=c++17

LOCAL_SRC_FILES += \
	src/system/logging/liblog/log_event_list.cpp \
 	src/system/logging/liblog/log_event_write.cpp \
	src/system/logging/liblog/logger_name.cpp \
	src/system/logging/liblog/logger_read.cpp \
	src/system/logging/liblog/logger_write.cpp \
	src/system/logging/liblog/logprint.cpp \
	src/system/logging/liblog/properties.cpp

include $(BUILD_STATIC_LIBRARY)

##############################################################################
# libbase
##############################################################################
include $(CLEAR_VARS)

LOCAL_MODULE := libbase

LOCAL_C_INCLUDES := \
	src/system/libbase/include

LOCAL_CFLAGS := \
	-Wall \
	-Wextra \
	-Werror \
	-D_FILE_OFFSET_BITS=64 \
	-Wno-c99-designator

LOCAL_CPPFLAGS := \
	-Wexit-time-destructors

LOCAL_CXXFLAGS := \
	-std=c++17

LOCAL_SRC_FILES += \
	src/system/libbase/abi_compatibility.cpp \
	src/system/libbase/chrono_utils.cpp \
	src/system/libbase/cmsg.cpp \
	 src/system/libbase/file.cpp \
	src/system/libbase/hex.cpp \
	src/system/libbase/logging.cpp \
	src/system/libbase/mapped_file.cpp \
	src/system/libbase/parsebool.cpp \
	src/system/libbase/parsenetaddress.cpp \
	src/system/libbase/posix_strerror_r.cpp \
	src/system/libbase/process.cpp \
	src/system/libbase/properties.cpp \
	src/system/libbase/stringprintf.cpp \
	src/system/libbase/strings.cpp \
	src/system/libbase/threads.cpp \
	src/system/libbase/test_utils.cpp

LOCAL_SHARED_LIBRARIES := log

LOCAL_EXPORT_C_INCLUDE_DIRS := \
	src/system/libbase/include

LOCAL_EXPORT_HEADER_LIBRARY_HEADERS := fmtlib

LOCAL_WHOLE_STATIC_LIBRARIES := fmtlib

include $(BUILD_STATIC_LIBRARY)

##############################################################################
# liblp
##############################################################################
include $(CLEAR_VARS)

LOCAL_MODULE := liblp

LOCAL_C_INCLUDES := \
	src/system/core/fs_mgr/include \
	src/system/core/fs_mgr/liblp \
	src/system/core/fs_mgr/liblp/include \
	src/system/libbase/include \
	src/system/core/libsparse/include \
	src/system/extras/ext4_utils/include \
	src/boringssl/include \
	src/system/core/libcutils/include

LOCAL_CFLAGS := \
	-Wall \
	-Werror

LOCAL_CPPFLAGS := \
	-D_FILE_OFFSET_BITS=64

LOCAL_CXXFLAGS := \
	-std=c++17
  
LOCAL_SRC_FILES := \
	src/system/core/fs_mgr/liblp/builder.cpp \
	src/system/core/fs_mgr/liblp/images.cpp \
	src/system/core/fs_mgr/liblp/partition_opener.cpp \
	src/system/core/fs_mgr/liblp/property_fetcher.cpp \
	src/system/core/fs_mgr/liblp/reader.cpp \
	src/system/core/fs_mgr/liblp/utility.cpp \
	src/system/core/fs_mgr/liblp/writer.cpp

LOCAL_STATIC_LIBRARIES := crypto base log crypto_utils sparse ext4_utils cutils

LOCAL_EXPORT_C_INCLUDE_DIRS := \
	src/system/core/fs_mgr/liblp/include	

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
# libcrypto_utils
##############################################################################
include $(CLEAR_VARS)

LOCAL_MODULE := libcrypto_utils

LOCAL_C_INCLUDES := \
	src/system/core/libcrypto_utils/include \
	src/boringssl/include

LOCAL_CFLAGS := \
	-Wall \
	-Wextra \
	-Werror

LOCAL_SRC_FILES := \
	src/system/core/libcrypto_utils/android_pubkey.cpp

LOCAL_STATIC_LIBRARIES := crypto

LOCAL_EXPORT_C_INCLUDE_DIRS := \
	src/system/core/libcrypto_utils/include

include $(BUILD_STATIC_LIBRARY)

##############################################################################
# libsparse
##############################################################################
include $(CLEAR_VARS)

LOCAL_MODULE := libsparse

LOCAL_C_INCLUDES := \
	src/system/core/libsparse/include \
	src/system/libbase/include

LOCAL_CFLAGS := \
	-Werror

LOCAL_SRC_FILES += \
	src/system/core/libsparse/backed_block.cpp \
	src/system/core/libsparse/output_file.cpp \
	src/system/core/libsparse/sparse.cpp \
	src/system/core/libsparse/sparse_crc32.cpp \
	src/system/core/libsparse/sparse_err.cpp \
	src/system/core/libsparse/sparse_read.cpp

LOCAL_STATIC_LIBRARIES := z base

LOCAL_EXPORT_C_INCLUDE_DIRS := \
	src/system/core/libsparse/include

include $(BUILD_STATIC_LIBRARY)

##############################################################################
#libext4_utils
##############################################################################
include $(CLEAR_VARS)

LOCAL_MODULE := libext4_utils

LOCAL_C_INCLUDES := \
	src/system/extras/ext4_utils/include \
	src/system/libbase/include

LOCAL_CFLAGS := \
	-fno-strict-aliasing\
	-Werror \
	-DREAL_UUID

LOCAL_SRC_FILES += \
	src/system/extras/ext4_utils/ext4_utils.cpp \
	src/system/extras/ext4_utils/wipe.cpp \
	src/system/extras/ext4_utils/ext4_sb.cpp

LOCAL_STATIC_LIBRARIES := z base cutils libext2_uuid

include $(BUILD_STATIC_LIBRARY)

#############################################################################
# libext2_uuid
#############################################################################
include $(CLEAR_VARS)

LOCAL_MODULE := libext2_uuid

LOCAL_C_INCLUDES := \
	src/external/e2fsprogs/lib \
	src/external/e2fsprogs/lib/uuid

LOCAL_CFLAGS := \
	-Wall \
	-Werror \
	-Wno-pointer-arith \
	-Wno-unused-function \
	-Wno-unused-parameter

LOCAL_SRC_FILES := \
	src/external/e2fsprogs/lib/uuid/clear.c \
	src/external/e2fsprogs/lib/uuid/compare.c \
	src/external/e2fsprogs/lib/uuid/copy.c \
	src/external/e2fsprogs/lib/uuid/gen_uuid.c \
	src/external/e2fsprogs/lib/uuid/isnull.c \
	src/external/e2fsprogs/lib/uuid/pack.c \
	src/external/e2fsprogs/lib/uuid/parse.c \
	src/external/e2fsprogs/lib/uuid/unpack.c \
	src/external/e2fsprogs/lib/uuid/unparse.c \
	src/external/e2fsprogs/lib/uuid/uuid_time.c

LOCAL_EXPORT_C_INCLUDE_DIRS := \
	src/external/e2fsprogs/lib \
	src/external/e2fsprogs/lib/uuid

include $(BUILD_STATIC_LIBRARY)

##############################################################################
# libcutils
##############################################################################
include $(CLEAR_VARS)

LOCAL_MODULE := libcutils

LOCAL_C_INCLUDES := \
	src/system/core/libcutils/include \
	src/system/libbase/include \
	src/system/core/libprocessgroup/include \
	src/system/logging/liblog/include

LOCAL_CFLAGS := \
	-Wno-exit-time-destructors \
	-Werror \
	-Wall \
	-Wextra \
	-D_GNU_SOURCE

LOCAL_SRC_FILES += \
	src/system/core/libcutils/config_utils.cpp \
	src/system/core/libcutils/iosched_policy.cpp \
	src/system/core/libcutils/load_file.cpp \
	src/system/core/libcutils/native_handle.cpp \
	src/system/core/libcutils/properties.cpp \
	src/system/core/libcutils/record_stream.cpp \
	src/system/core/libcutils/strlcpy.c \
	src/system/core/libcutils/threads.cpp \
	\
	src/system/core/libcutils/android_reboot.cpp \
	src/system/core/libcutils/ashmem-dev.cpp \
	src/system/core/libcutils/canned_fs_config.cpp \
	src/system/core/libcutils/fs_config.cpp \
	src/system/core/libcutils/klog.cpp \
	src/system/core/libcutils/partition_utils.cpp \
	src/system/core/libcutils/qtaguid.cpp \
	src/system/core/libcutils/trace-dev.cpp \
	src/system/core/libcutils/uevent.cpp \
	\
	src/system/core/libcutils/sockets.cpp \
	src/system/core/libcutils/android_get_control_file.cpp \
	src/system/core/libcutils/socket_inaddr_any_server_unix.cpp \
	src/system/core/libcutils/socket_local_client_unix.cpp \
	src/system/core/libcutils/socket_local_server_unix.cpp \
	src/system/core/libcutils/socket_network_client_unix.cpp \
	src/system/core/libcutils/sockets_unix.cpp

LOCAL_STATIC_LIBRARIES := log base

LOCAL_EXPORT_C_INCLUDE_DIRS := \
	src/system/core/libcutils/include

include $(BUILD_STATIC_LIBRARY)

##############################################################################
# libpcre
##############################################################################
include $(CLEAR_VARS)

LOCAL_MODULE := libpcre

LOCAL_C_INCLUDES := \
	src/external/pcre/include

LOCAL_CFLAGS := \
	-DHAVE_CONFIG_H \
	-Wall \
	-Werror \
	-DPCRE2_CODE_UNIT_WIDTH=8

LOCAL_SRC_FILES := \
	src/external/pcre/src/pcre2_auto_possess.c \
	src/external/pcre/src/pcre2_compile.c \
	src/external/pcre/src/pcre2_config.c \
	src/external/pcre/src/pcre2_context.c \
	src/external/pcre/src/pcre2_convert.c \
	src/external/pcre/src/pcre2_dfa_match.c \
	src/external/pcre/src/pcre2_error.c \
	src/external/pcre/src/pcre2_extuni.c \
	src/external/pcre/src/pcre2_find_bracket.c \
	src/external/pcre/src/pcre2_maketables.c \
	src/external/pcre/src/pcre2_match.c \
	src/external/pcre/src/pcre2_match_data.c \
	src/external/pcre/src/pcre2_jit_compile.c \
	src/external/pcre/src/pcre2_newline.c \
	src/external/pcre/src/pcre2_ord2utf.c \
	src/external/pcre/src/pcre2_pattern_info.c \
	src/external/pcre/src/pcre2_script_run.c \
	src/external/pcre/src/pcre2_serialize.c \
	src/external/pcre/src/pcre2_string_utils.c \
	src/external/pcre/src/pcre2_study.c \
	src/external/pcre/src/pcre2_substitute.c \
	src/external/pcre/src/pcre2_substring.c \
	src/external/pcre/src/pcre2_tables.c \
	src/external/pcre/src/pcre2_ucd.c \
	src/external/pcre/src/pcre2_valid_utf.c \
	src/external/pcre/src/pcre2_xclass.c \
	src/external/pcre/src/pcre2_chartables.c    

LOCAL_EXPORT_C_INCLUDE_DIRS := \
	src/external/pcre/include

include $(BUILD_STATIC_LIBRARY)

##############################################################################
# libpackagelistparser
##############################################################################
include $(CLEAR_VARS)

LOCAL_MODULE := libpackagelistparser

LOCAL_C_INCLUDES := \
	src/system/core/libpackagelistparser/include \
	src/system/logging/liblog/include

LOCAL_SRC_FILES := \
	src/system/core/libpackagelistparser/packagelistparser.cpp

LOCAL_STATIC_LIBRARIES := log

LOCAL_EXPORT_C_INCLUDE_DIRS := \
	src/system/core/libpackagelistparser/include

include $(BUILD_STATIC_LIBRARY)

##############################################################################
# libselinux
##############################################################################
include $(CLEAR_VARS)

LOCAL_MODULE := libselinux

LOCAL_C_INCLUDES := \
	src/external/selinux/libselinux/include \
	src/external/selinux/libselinux/src \
	src/system/core/libcutils/include \
	src/system/logging/liblog/include \
	src/system/core/libpackagelistparser/include \
	src/external/pcre/include

LOCAL_CFLAGS := \
	-DNO_PERSISTENTLY_STORED_PATTERNS \
	-DDISABLE_SETRANS \
	-DDISABLE_BOOL \
	-D_GNU_SOURCE \
	-DNO_MEDIA_BACKEND \
	-DNO_X_BACKEND \
	-DNO_DB_BACKEND \
	-Wall \
	-Werror \
	-Wno-error=missing-noreturn \
	-Wno-error=unused-function \
	-Wno-error=unused-variable \
	-DBUILD_HOST \
	-DUSE_PCRE2 \
	-DAUDITD_LOG_TAG=1003 \
	-Wno-unused-but-set-variable

LOCAL_SRC_FILES := \
	src/external/selinux/libselinux/src/booleans.c \
	src/external/selinux/libselinux/src/callbacks.c \
	src/external/selinux/libselinux/src/freecon.c \
	src/external/selinux/libselinux/src/label_backends_android.c \
	src/external/selinux/libselinux/src/label.c \
	src/external/selinux/libselinux/src/label_support.c \
	src/external/selinux/libselinux/src/matchpathcon.c \
	src/external/selinux/libselinux/src/setrans_client.c \
	src/external/selinux/libselinux/src/sha1.c \
	src/external/selinux/libselinux/src/android/android.c \
	src/external/selinux/libselinux/src/canonicalize_context.c \
	src/external/selinux/libselinux/src/checkAccess.c \
	src/external/selinux/libselinux/src/check_context.c \
	src/external/selinux/libselinux/src/disable.c \
	src/external/selinux/libselinux/src/fgetfilecon.c \
	src/external/selinux/libselinux/src/fsetfilecon.c \
	src/external/selinux/libselinux/src/getpeercon.c \
	src/external/selinux/libselinux/src/lgetfilecon.c \
	src/external/selinux/libselinux/src/lsetfilecon.c \
	src/external/selinux/libselinux/src/policyvers.c \
	src/external/selinux/libselinux/src/setenforce.c \
	src/external/selinux/libselinux/src/setfilecon.c \
	src/external/selinux/libselinux/src/android/android_host.c \
	src/external/selinux/libselinux/src/avc.c \
	src/external/selinux/libselinux/src/avc_internal.c \
	src/external/selinux/libselinux/src/avc_sidtab.c \
	src/external/selinux/libselinux/src/compute_av.c \
	src/external/selinux/libselinux/src/compute_create.c \
	src/external/selinux/libselinux/src/compute_member.c \
	src/external/selinux/libselinux/src/context.c \
	src/external/selinux/libselinux/src/deny_unknown.c \
	src/external/selinux/libselinux/src/enabled.c \
	src/external/selinux/libselinux/src/getenforce.c \
	src/external/selinux/libselinux/src/getfilecon.c \
	src/external/selinux/libselinux/src/get_initial_context.c \
	src/external/selinux/libselinux/src/init.c \
	src/external/selinux/libselinux/src/load_policy.c \
	src/external/selinux/libselinux/src/mapping.c \
	src/external/selinux/libselinux/src/procattr.c \
	src/external/selinux/libselinux/src/reject_unknown.c \
	src/external/selinux/libselinux/src/sestatus.c \
	src/external/selinux/libselinux/src/setexecfilecon.c \
	src/external/selinux/libselinux/src/stringrep.c \
	src/external/selinux/libselinux/src/android/android_platform.c \
	src/external/selinux/libselinux/src/label_file.c \
	src/external/selinux/libselinux/src/regex.c

LOCAL_STATIC_LIBRARIES := pcre log packagelistparser

LOCAL_EXPORT_C_INCLUDE_DIRS := \
	 src/external/selinux/libselinux/include

LOCAL_WHOLE_STATIC_LIBRARIES := packagelistparser

include $(BUILD_STATIC_LIBRARY)

##############################################################################
# libfstab
##############################################################################
include $(CLEAR_VARS)

LOCAL_MODULE := libfstab

LOCAL_C_INCLUDES := \
	src/system/core/fs_mgr/include \
	src/system/core/fs_mgr/include_fstab \
	src/system/libbase/include \
	src/system/gsid/include

LOCAL_CFLAGS := \
	-Wall \
	-Werror \
	-DNO_SKIP_MOUNT

LOCAL_CXXFLAGS := \
	-std=c++17

LOCAL_SRC_FILES := \
	src/system/core/fs_mgr/fs_mgr_fstab.cpp \
	src/system/core/fs_mgr/fs_mgr_boot_config.cpp \
	src/system/core/fs_mgr/fs_mgr_slotselect.cpp

LOCAL_EXPORT_C_INCLUDE_DIRS := \
	src/system/core/fs_mgr/include_fstab

include $(BUILD_STATIC_LIBRARY)

##############################################################################
# libprotobuf-cpp-full
##############################################################################
include $(CLEAR_VARS)

LOCAL_MODULE := libprotobuf-cpp-full

LOCAL_C_INCLUDES := \
	src/external/protobuf/android \
	src/external/protobuf/src

LOCAL_CFLAGS := \
	-DHAVE_ZLIB=1 \
	-Wall \
	-Werror \
	-Wno-unused-function \
	-Wno-sign-compare \
	-Wno-unused-parameter \
	-Wno-sign-promo \
	-Wno-inconsistent-missing-override

LOCAL_CXXFLAGS := \
	-std=c++17 \
	-Wno-unused-const-variable \
	-Wno-error=user-defined-warnings

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

##############################################################################
# libsquashfs_utils
##############################################################################
include $(CLEAR_VARS)

LOCAL_MODULE := libsquashfs_utils

LOCAL_C_INCLUDES := \
	src/system/extras/squashfs_utils \
	src/system/core/libcutils/include \
	src/external/squashfs-tools/squashfs-tools

LOCAL_CFLAGS := \
	-Wall \
	-Werror \
	-D_GNU_SOURCE \
	-DSQUASHFS_NO_KLOG

LOCAL_SRC_FILES := \
	src/system/extras/squashfs_utils/squashfs_utils.c

LOCAL_STATIC_LIBRARIES := cutils

include $(BUILD_STATIC_LIBRARY)

##############################################################################
# libfec
##############################################################################
include $(CLEAR_VARS)

LOCAL_MODULE := libfec

LOCAL_C_INCLUDES := \
	src/system/extras/libfec/include \
	src/system/extras/ext4_utils/include \
	src/system/extras/squashfs_utils \
	src/system/libbase/include \
	src/system/core/libcrypto_utils/include \
	src/boringssl/include \
	src/system/core/libutils/include \
	src/external/fec

LOCAL_CFLAGS := \
	-Wall \
	-Werror \
	-O3 \
	-D_LARGEFILE64_SOURCE \
	-D_GNU_SOURCE \
	-DFEC_NO_KLOG

LOCAL_SRC_FILES := \
	src/system/extras/libfec/fec_open.cpp \
	src/system/extras/libfec/fec_read.cpp \
	src/system/extras/libfec/fec_verity.cpp \
	src/system/extras/libfec/fec_process.cpp

LOCAL_EXPORT_C_INCLUDE_DIRS := \
	src/system/extras/libfec/include

LOCAL_STATIC_LIBRARIES := base crypto crypto_utils cutils ext4_utils squashfs_utils

include $(BUILD_STATIC_LIBRARY)

##############################################################################
# libjsonpbparse
##############################################################################
include $(CLEAR_VARS)

LOCAL_MODULE := libjsonpbparse

LOCAL_C_INCLUDES := \
	src/system/extras/libjsonpb/parse/include \
	src/system/libbase/include \
	src/external/protobuf/src

LOCAL_CFLAGS := \
	-Wall \
	-Werror \
	-Wno-unused-parameter

LOCAL_CXXFLAGS := \
	-std=c++17

LOCAL_SRC_FILES := \
	src/system/extras/libjsonpb/parse/jsonpb.cpp

LOCAL_STATIC_LIBRARIES := base protobuf-cpp-full

include $(BUILD_STATIC_LIBRARY)

#############################################################################
# libavb
#############################################################################
include $(CLEAR_VARS)

LOCAL_MODULE := libavb

LOCAL_C_INCLUDES := \
	src/external/avb/libavb/boringssl \
	src/boringssl/include \
	src/external/avb

LOCAL_CFLAGS := \
	-D_FILE_OFFSET_BITS=64  \
	-D_POSIX_C_SOURCE=199309L \
	-Wa,--noexecstack \
	-Werror \
	-Wall \
	-Wextra \
	-Wformat=2 \
	-Wmissing-prototypes \
	-Wno-psabi \
	-Wno-unused-parameter \
	-Wno-format \
	-ffunction-sections \
	-fstack-protector-strong \
	-g \
	-DAVB_ENABLE_DEBUG \
	-DAVB_COMPILATION

LOCAL_CPPFLAGS := \
	-Wnon-virtual-dtor \
	-fno-strict-aliasing

LOCAL_SRC_FILES := \
	src/external/avb/libavb/avb_chain_partition_descriptor.c \
	src/external/avb/libavb/avb_cmdline.c \
	src/external/avb/libavb/avb_crc32.c \
	src/external/avb/libavb/avb_crypto.c \
	src/external/avb/libavb/avb_descriptor.c \
	src/external/avb/libavb/avb_footer.c \
	src/external/avb/libavb/avb_hash_descriptor.c \
	src/external/avb/libavb/avb_hashtree_descriptor.c \
	src/external/avb/libavb/avb_kernel_cmdline_descriptor.c \
	src/external/avb/libavb/avb_property_descriptor.c \
	src/external/avb/libavb/avb_rsa.c \
	src/external/avb/libavb/avb_slot_verify.c \
	src/external/avb/libavb/avb_util.c \
	src/external/avb/libavb/avb_vbmeta_image.c \
	src/external/avb/libavb/avb_version.c \
	src/external/avb/libavb/boringssl/sha.c

LOCAL_STATIC_LIBRARIES := crypto

include $(BUILD_STATIC_LIBRARY)

#############################################################################
# libfs_avb
#############################################################################
include $(CLEAR_VARS)

LOCAL_MODULE := libfs_avb

LOCAL_C_INCLUDES := \
	src/system/core/fs_mgr/libfs_avb/include \
	src/external/avb \
	src/system/core/fs_mgr/include_fstab \
	src/system/libbase/include \
	src/system/core/fs_mgr/libdm/include \
	src/system/core/libutils/include \
	src/external/fmtlib/include \
	src/system/gsid/include \
	src/boringssl/include

LOCAL_CFLAGS := \
	-Wall \
	-Werror \
	-Wno-inconsistent-missing-override

LOCAL_CXXFLAGS := \
	-std=c++17

LOCAL_SRC_FILES := \
	src/system/core/fs_mgr/libfs_avb/avb_ops.cpp \
	src/system/core/fs_mgr/libfs_avb/avb_util.cpp \
	src/system/core/fs_mgr/libfs_avb/fs_avb.cpp \
	src/system/core/fs_mgr/libfs_avb/fs_avb_util.cpp \
	src/system/core/fs_mgr/libfs_avb/types.cpp \
	src/system/core/fs_mgr/libfs_avb/util.cpp

LOCAL_STATIC_LIBRARIES := avb dm gsi fstab base crypto

include $(BUILD_STATIC_LIBRARY)

#############################################################################
# libdm
#############################################################################
include $(CLEAR_VARS)

LOCAL_MODULE := libdm

LOCAL_C_INCLUDES := \
	src/system/core/fs_mgr/libdm/include \
	src/system/libbase/include \
	src/external/e2fsprogs/lib

LOCAL_CFLAGS := \
	-Wall \
	-Werror \
	-Wno-inconsistent-missing-override

LOCAL_CXXFLAGS := \
	-std=c++17

LOCAL_SRC_FILES := \
	src/system/core/fs_mgr/libdm/dm_table.cpp \
	src/system/core/fs_mgr/libdm/dm_target.cpp \
	src/system/core/fs_mgr/libdm/dm.cpp \
	src/system/core/fs_mgr/libdm/loop_control.cpp \
	src/system/core/fs_mgr/libdm/utility.cpp

LOCAL_EXPORT_C_INCLUDE_DIRS := \
	src/system/core/fs_mgr/libdm/include

LOCAL_STATIC_LIBRARIES := ext2_uuid

include $(BUILD_STATIC_LIBRARY)

#############################################################################
# libgsi
#############################################################################
include $(CLEAR_VARS)

LOCAL_MODULE := libgsi

LOCAL_C_INCLUDES := \
	src/system/gsid/include \
	src/system/libbase/include

LOCAL_CFLAGS := \
	-std=c++17

LOCAL_SRC_FILES := \
	src/system/gsid/libgsi.cpp

LOCAL_STATIC_LIBRARIES := base

include $(BUILD_STATIC_LIBRARY)

#############################################################################
# liblogwrap
#############################################################################
include $(CLEAR_VARS)

LOCAL_MODULE := liblogwrap

LOCAL_C_INCLUDES := \
	src/system/logging/logwrapper/include \
	src/system/logging/liblog/include \
	src/system/libbase/include \
	src/system/core/libcutils/include

LOCAL_CFLAGS := \
	-Werror

LOCAL_SRC_FILES := \
	src/system/logging/logwrapper/logwrap.cpp

LOCAL_EXPORT_C_INCLUDE_DIRS := \
	src/system/logging/logwrapper/include

LOCAL_STATIC_LIBRARIES := cutils log

include $(BUILD_STATIC_LIBRARY)

#############################################################################
# libkeyutils
#############################################################################
include $(CLEAR_VARS)

LOCAL_MODULE := libkeyutils

LOCAL_C_INCLUDES := \
	src/system/core/libkeyutils/include

LOCAL_CFLAGS := \
	-Werror

LOCAL_SRC_FILES := \
	src/system/core/libkeyutils/keyutils.cpp

LOCAL_EXPORT_C_INCLUDE_DIRS := \
	src/system/core/libkeyutils/include

include $(BUILD_STATIC_LIBRARY)

#############################################################################
# libfscrypt
#############################################################################
include $(CLEAR_VARS)

LOCAL_MODULE := libfscrypt

LOCAL_C_INCLUDES := \
	src/system/extras/libfscrypt/include \
	src/system/libbase/include \
	src/system/core/libcutils/include \
	src/system/logging/logwrapper/include \
	src/system/core/libutils/include

LOCAL_CXXFLAGS := \
	-std=c++17

LOCAL_SRC_FILES := \
	src/system/extras/libfscrypt/fscrypt.cpp

LOCAL_EXPORT_C_INCLUDE_DIRS := \
	src/system/extras/libfscrypt/include

LOCAL_STATIC_LIBRARIES := base cutils keyutils logwrap

include $(BUILD_STATIC_LIBRARY)

#############################################################################
# libfs_mgr
#############################################################################
include $(CLEAR_VARS)

LOCAL_MODULE := libfs_mgr

LOCAL_C_INCLUDES := \
	src/system/core/fs_mgr/include \
	src/system/vold \
	src/system/core/fs_mgr/libfiemap/include \
	src/system/libbase/include \
	src/system/core/fs_mgr/libdm/include \
	src/external/fmtlib/include \
	src/system/core/fs_mgr/include_fstab \
	src/system/core/libcutils/include \
	src/system/extras/ext4_utils/include \
	src/system/core/fs_mgr/libfs_avb/include \
	src/external/avb \
	src/system/extras/libfscrypt/include \
	src/system/core/fs_mgr/liblp/include \
	src/system/logging/liblog/include \
	src/system/logging/logwrapper/include \
	src/external/selinux/libselinux/include \
	src/system/core/fs_mgr \
	src/system/gsid/include \
	src/system/core/fs_mgr/libstorage_literals

LOCAL_CFLAGS := \
	-Wall \
	-Werror \
	-D_FILE_OFFSET_BITS=64

LOCAL_CPPFLAGS := \
	-DALLOW_ADBD_DISABLE_VERITY=0

LOCAL_CXXFLAGS := \
	-std=c++17 \
	-Wno-macro-redefined \
	-Wno-inconsistent-missing-override

LOCAL_SRC_FILES := \
	src/system/core/fs_mgr/blockdev.cpp \
	src/system/core/fs_mgr/file_wait.cpp \
	src/system/core/fs_mgr/fs_mgr.cpp \
	src/system/core/fs_mgr/fs_mgr_format.cpp \
	src/system/core/fs_mgr/fs_mgr_dm_linear.cpp \
	src/system/core/fs_mgr/fs_mgr_overlayfs.cpp \
	src/system/core/fs_mgr/fs_mgr_roots.cpp \
	src/system/core/fs_mgr/fs_mgr_vendor_overlay.cpp

LOCAL_EXPORT_C_INCLUDE_DIRS := \
	src/system/core/fs_mgr/include

LOCAL_STATIC_LIBRARIES := base crypto crypto_utils cutils ext4_utils fec log lp selinux avb fs_avb fstab dm gsi logwrap ext2_uuid fscrypt

LOCAL_WHOLE_STATIC_LIBRARIES := logwrap dm ext2_uuid fscrypt fstab

include $(BUILD_STATIC_LIBRARY)

##############################################################################
# liblpdump
##############################################################################
include $(CLEAR_VARS)

LOCAL_MODULE := liblpdump

LOCAL_C_INCLUDES := \
	src/system/core/fs_mgr/include_fstab \
	src/external/protobuf/src \
	src/system/libbase/include \
	src/system/core/include \
	src/system/core/fs_mgr/include \
	src/system/extras/libjsonpb/parse/include \
	src/system/core/fs_mgr/liblp/include \
	src/system/extras/partition_tools

LOCAL_CFLAGS := \
	-Werror \
	-Wextra \
	-D_FILE_OFFSET_BITS=64

LOCAL_CXXFLAGS := \
	-std=c++17

LOCAL_SRC_FILES := \
	src/system/extras/partition_tools/lpdump.cc \
	src/system/extras/partition_tools/dynamic_partitions_device_info.pb.cc

LOCAL_STATIC_LIBRARIES := base log lp cutils fs_mgr jsonpbparse protobuf-cpp-full

include $(BUILD_STATIC_LIBRARY)

##############################################################################
# lpmake
##############################################################################
include $(CLEAR_VARS)

LOCAL_MODULE := lpmake

LOCAL_C_INCLUDES := \
	src/system/libbase/include \
	src/system/core/fs_mgr/liblp/include \
	src/external/fmtlib/include

LOCAL_CFLAGS := \
	-Werror \
	-Wextra
	-D_FILE_OFFSET_BITS=64

LOCAL_CXXFLAGS := \
	-std=c++17

LOCAL_LDFLAGS := -fPIE -static

LOCAL_SRC_FILES := src/system/extras/partition_tools/lpmake.cc

LOCAL_LDLIBS := -lz

LOCAL_STATIC_LIBRARIES := base log lp

include $(BUILD_EXECUTABLE)

##############################################################################
# lpunpack
##############################################################################
include $(CLEAR_VARS)

LOCAL_MODULE := lpunpack

LOCAL_C_INCLUDES := \
	src/system/libbase/include \
	src/system/core/fs_mgr/liblp/include \
	src/system/core/libsparse/include

LOCAL_CFLAGS := \
	-Werror \
	-Wextra \
	-D_FILE_OFFSET_BITS=64

LOCAL_CXXFLAGS := \
	-std=c++17

LOCAL_LDFLAGS := -fPIE -static

LOCAL_SRC_FILES := src/system/extras/partition_tools/lpunpack.cc

LOCAL_STATIC_LIBRARIES := sparse base log lp

include $(BUILD_EXECUTABLE)

##############################################################################
# lpflash
##############################################################################
include $(CLEAR_VARS)

LOCAL_MODULE := lpflash

LOCAL_C_INCLUDES := \
	src/system/libbase/include \
	src/system/core/fs_mgr/liblp/include

LOCAL_CFLAGS := \
	-Werror \
	-Wextra \
	-D_FILE_OFFSET_BITS=64

LOCAL_CXXFLAGS := \
	-std=c++17

LOCAL_LDFLAGS := -fPIE -static

LOCAL_SRC_FILES := src/system/extras/partition_tools/lpflash.cc

LOCAL_STATIC_LIBRARIES := base log lp

include $(BUILD_EXECUTABLE)

##############################################################################
# lpadd
##############################################################################
include $(CLEAR_VARS)

LOCAL_MODULE := lpadd

LOCAL_C_INCLUDES := \
	src/system/libbase/include \
	src/system/core/fs_mgr/liblp/include \
	src/system/core/libsparse/include

LOCAL_CFLAGS := \
	-Werror \
	-Wextra \
	-D_FILE_OFFSET_BITS=64

LOCAL_CXXFLAGS := \
	-std=c++17

LOCAL_LDFLAGS := -fPIE -static

LOCAL_SRC_FILES := src/system/extras/partition_tools/lpadd.cc

LOCAL_STATIC_LIBRARIES := sparse base log lp

include $(BUILD_EXECUTABLE)

##############################################################################
# lpdump
##############################################################################
include $(CLEAR_VARS)

LOCAL_MODULE := lpdump_binary

LOCAL_MODULE_FILENAME := lpdump

LOCAL_C_INCLUDES := \
	src/system/libbase/include \
	src/system/core/fs_mgr/liblp/include

LOCAL_CFLAGS := \
	-Werror \
	-Wextra \
	-D_FILE_OFFSET_BITS=64

LOCAL_CXXFLAGS := \
	-std=c++17

LOCAL_LDFLAGS := -fPIE -static

LOCAL_SRC_FILES := \
	src/system/extras/partition_tools/lpdump_host.cc

LOCAL_STATIC_LIBRARIES := base log lp lpdump jsonpbparse

include $(BUILD_EXECUTABLE)

