#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from sm6150-common
include device/xiaomi/sm6150-common/BoardConfigCommon.mk

DEVICE_PATH := device/xiaomi/phoenix

# Assert
TARGET_OTA_ASSERT_DEVICE := phoenix,phoenixin

# Kernel
TARGET_KERNEL_CONFIG := phoenix_defconfig

# Init
TARGET_INIT_VENDOR_LIB := //$(DEVICE_PATH):libinit_phoenix
TARGET_RECOVERY_DEVICE_MODULES := libinit_phoenix

# Inherit from proprietary files
include vendor/xiaomi/phoenix/BoardConfigVendor.mk
