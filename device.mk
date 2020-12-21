#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Installs gsi keys into ramdisk, to boot a GSI with verified boot.
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Inherit from sm6150-common
$(call inherit-product, device/xiaomi/sm6150-common/sm6150.mk)

# API level, the device has been commercially launched on
PRODUCT_SHIPPING_API_LEVEL := 29

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/audio_platform_info_intcodec.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_intcodec.xml \
    $(LOCAL_PATH)/configs/audio/mixer_paths_idp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_idp.xml \
    $(LOCAL_PATH)/configs/audio/mixer_paths_overlay_dynamic.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_overlay_dynamic.xml \
    $(LOCAL_PATH)/configs/audio/mixer_paths_overlay_static.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_overlay_static.xml \
    $(LOCAL_PATH)/configs/audio/sound_trigger_mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths.xml

# Fstab
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.qcom:$(TARGET_COPY_OUT_RAMDISK)/fstab.qcom \
    $(LOCAL_PATH)/rootdir/etc/fstab.qcom:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.qcom

# Init scripts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/init.phoenix.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.phoenix.rc

# Fingerprint
PRODUCT_PACKAGES += \
    libkeymaster_messages.vendor:64

# Input
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/idc/uinput-fpc.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/uinput-fpc.idc \
    $(LOCAL_PATH)/configs/idc/uinput-goodix.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/uinput-goodix.idc

# Keylayouts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/keylayout/uinput-fpc.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/uinput-fpc.kl \
    $(LOCAL_PATH)/configs/keylayout/uinput-goodix.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/uinput-goodix.kl

# IR
PRODUCT_PACKAGES += \
    android.hardware.ir@1.0-impl \
    android.hardware.ir@1.0-service

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.consumerir.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.consumerir.xml

# NFC
PRODUCT_PACKAGES += \
    com.android.nfc_extras \
    NfcNci \
    SecureElement \
    Tag

PRODUCT_PACKAGES += \
    android.hardware.nfc@1.2-service

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/nfc/libnfc-nci.conf:$(TARGET_COPY_OUT_PRODUCT)/etc/libnfc-nci.conf \
    $(LOCAL_PATH)/configs/nfc/libnfc-nxp.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nxp.conf

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.nfc.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_phoenix/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.nfc.ese.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_phoenix/android.hardware.nfc.ese.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_phoenix/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.nfc.hcef.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_phoenix/android.hardware.nfc.hcef.xml \
    frameworks/native/data/etc/android.hardware.nfc.uicc.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_phoenix/android.hardware.nfc.uicc.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_phoenix/com.android.nfc_extras.xml \
    frameworks/native/data/etc/com.nxp.mifare.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_phoenix/com.nxp.mifare.xml

# Overlay
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay \
    $(LOCAL_PATH)/overlay-lineage

# Partitions
PRODUCT_BUILD_SUPER_PARTITION := false
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Recovery
PRODUCT_PACKAGES += \
    fastbootd

# Screen density
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi
TARGET_SCREEN_DENSITY := 440

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# WiFi
PRODUCT_PACKAGES += \
    PhoenixWifiOverlay

# Call the proprietary setup
$(call inherit-product, vendor/xiaomi/phoenix/phoenix-vendor.mk)
