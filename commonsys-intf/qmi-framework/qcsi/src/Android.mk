LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_COPY_HEADERS_TO   := qmi-framework/inc
LOCAL_COPY_HEADERS      := ../inc/qmi_csi_common.h

common_libqcsi_cflags := -g
common_libqcsi_cflags += -O2
common_libqcsi_cflags += -fno-inline
common_libqcsi_cflags += -fno-short-enums
common_libqcsi_cflags += -fpic
common_libqcsi_cflags += -Wall
common_libqcsi_cflags += -Wno-unused-parameter

LOCAL_CFLAGS := $(common_libqcsi_cflags)
LOCAL_CFLAGS += -DQMI_FW_ADB_LOG
LOCAL_CFLAGS += -DQMI_FW_ANDROID
LOCAL_CFLAGS += -DQMI_CSI_ANDROID
LOCAL_CFLAGS += -DQMI_CSI_SMEM_LOG_DISABLE

LOCAL_C_INCLUDES := $(LOCAL_PATH)/../../common/inc
LOCAL_C_INCLUDES += $(LOCAL_PATH)/../../inc
LOCAL_C_INCLUDES += $(LOCAL_PATH)/../inc
LOCAL_C_INCLUDES += $(TARGET_OUT_HEADERS)/qsocket/inc
LOCAL_C_INCLUDES += $(TARGET_OUT_HEADERS)/qrtr/inc

LOCAL_SRC_FILES  := qmi_csi_common.c
LOCAL_SRC_FILES  += qmi_csi_xport_ipc_router.c
LOCAL_SRC_FILES  += qmi_csi_target.c
LOCAL_SRC_FILES  += qmi_csi_xport_qrtr.c

LOCAL_SHARED_LIBRARIES := libcutils
LOCAL_SHARED_LIBRARIES += libutils
LOCAL_SHARED_LIBRARIES += libqmi_encdec
LOCAL_SHARED_LIBRARIES += liblog

LOCAL_STATIC_LIBRARIES := libqmi_common

LOCAL_MODULE := libqmi_csi

LOCAL_PRELINK_MODULE := false

LOCAL_MODULE_OWNER := qti
LOCAL_PROPRIETARY_MODULE := true

include $(BUILD_SHARED_LIBRARY)

# System Library
include $(CLEAR_VARS)

common_libqcsi_cflags := -g
common_libqcsi_cflags += -O2
common_libqcsi_cflags += -fno-inline
common_libqcsi_cflags += -fno-short-enums
common_libqcsi_cflags += -fpic
common_libqcsi_cflags += -Wall
common_libqcsi_cflags += -Wno-unused-parameter

LOCAL_CFLAGS := $(common_libqcsi_cflags)
LOCAL_CFLAGS += -DQMI_FW_ADB_LOG
LOCAL_CFLAGS += -DQMI_FW_ANDROID
LOCAL_CFLAGS += -DQMI_CSI_ANDROID
LOCAL_CFLAGS += -DQMI_CSI_SMEM_LOG_DISABLE
LOCAL_CFLAGS += -DQMI_CCI_SYSTEM

LOCAL_C_INCLUDES := $(LOCAL_PATH)/../../common/inc
LOCAL_C_INCLUDES += $(LOCAL_PATH)/../../inc
LOCAL_C_INCLUDES += $(LOCAL_PATH)/../inc
LOCAL_C_INCLUDES += $(TARGET_OUT_HEADERS)/qsocket/inc
LOCAL_C_INCLUDES += $(TARGET_OUT_HEADERS)/qrtr/inc

LOCAL_SRC_FILES  := qmi_csi_common.c
LOCAL_SRC_FILES  += qmi_csi_xport_ipc_router.c
LOCAL_SRC_FILES  += qmi_csi_target.c
LOCAL_SRC_FILES  += qmi_csi_xport_qrtr.c

LOCAL_SHARED_LIBRARIES := libcutils
LOCAL_SHARED_LIBRARIES += libutils
LOCAL_SHARED_LIBRARIES += liblog
LOCAL_STATIC_LIBRARIES := libqmi_common_system
LOCAL_STATIC_LIBRARIES += libqmi_encdec_system

LOCAL_MODULE := libqmi_csi_system
LOCAL_PRELINK_MODULE := false

include $(BUILD_SHARED_LIBRARY)

# Header library
include $(CLEAR_VARS)

LOCAL_MODULE := libqmi_csi_headers

LOCAL_EXPORT_C_INCLUDE_DIRS := $(LOCAL_PATH)/../../common/inc
LOCAL_EXPORT_C_INCLUDE_DIRS += $(LOCAL_PATH)/../../inc
LOCAL_EXPORT_C_INCLUDE_DIRS += $(LOCAL_PATH)/../inc

include $(BUILD_HEADER_LIBRARY)
