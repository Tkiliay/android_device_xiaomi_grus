#
# Copyright (C) 2023 The CherishOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common sweet stuff.
$(call inherit-product, vendor/cherish/config/common_full_phone.mk)

# Inherit from grus device
$(call inherit-product, device/xiaomi/grus/device.mk)

PRODUCT_NAME := cherish_grus
PRODUCT_DEVICE := grus
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := Mi 9 SE

# Include GAPPS
WITH_GAPPS := true

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

PRODUCT_SYSTEM_NAME := grus

BUILD_FINGERPRINT := "Xiaomi/grus/grus:11/RKQ1.200826.002/V12.5.4.0.RFBCNXM:user/release-keys"

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="grus-user 11 RKQ1.200826.002 V12.5.4.0.RFBCNXM release-keys" \
    TARGET_PRODUCT="grus"

# FOD animations
EXTRA_UDFPS_ANIMATIONS := true

## Boot Animation
TARGET_BOOT_ANIMATION_RES := 1080

# Inherit some props from Cherish
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.cherish.maintainer=Toyohama

CHERISH_BUILD_TYPE=OFFICIAL
TARGET_SUPPORTS_CALL_RECORDING := true
TARGET_SUPPORTS_GOOGLE_RECORDER := false
TARGET_INCLUDE_LIVE_WALLPAPERS := false

