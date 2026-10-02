#
# Copyright 2017 The Android Open Source Project
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),kuntao_row)
include $(call all-makefiles-under,$(LOCAL_PATH))
endif
