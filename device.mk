#
# Copyright (C) 2026 The OrangeFox Recovery Project
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := device/lenovo/kuntao_row

# A-only legacy device: no A/B, no dynamic partitions, no vendor_boot
AB_OTA_UPDATER := false
BOARD_USES_RECOVERY_AS_BOOT :=
PRODUCT_BUILD_RECOVERY_IMAGE := true

# Recovery packages
PRODUCT_PACKAGES += \
    charger_res_images \
    charger

PRODUCT_PROPERTY_OVERRIDES += \
    ro.hardware.keystore=msm8953
