#
# Copyright (C) 2018-2019,2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

$(call inherit-product, device/xiaomi/grus/device.mk)

# Inherit some common sweet stuff.
$(call inherit-product, vendor/cherish/config/common_full_phone.mk)

# Device identifier. This must come after all inclusions.
PRODUCT_NAME := cherish_grus
PRODUCT_DEVICE := grus
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := Mi 9 SE
PRODUCT_MANUFACTURER := Xiaomi

PRODUCT_SYSTEM_NAME := grus

BUILD_FINGERPRINT := "Xiaomi/grus/grus:11/RKQ1.200826.002/V12.5.1.0.RFBMIXM:user/release-keys"

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="grus-user 11 RKQ1.200826.002 V12.5.1.0.RFBMIXM release-keys" \
    TARGET_PRODUCT="grus"

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

# Inherit some props from Cherish
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.cherish.maintainer=Toyohama
TARGET_INCLUDE_LIVE_WALLPAPERS := true
TARGET_SUPPORTS_QUICK_TAP := true
