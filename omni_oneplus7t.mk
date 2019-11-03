# Copyright (C) 2010 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This file is the build configuration for a full Android
# build for grouper hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).
#

VENDOR_EXCEPTION_PATHS := oneplus \
    omni

# Sample: This is where we'd set a backup provider if we had one
# $(call inherit-product, device/sample/products/backup_overlay.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

# Get the prebuilt list of APNs
$(call inherit-product, vendor/omni/config/gsm.mk)

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

PRODUCT_USE_DYNAMIC_PARTITIONS := true
BOARD_SUPER_PARTITION_SIZE := 15032385536
BOARD_SUPER_PARTITION_GROUPS := oneplus_dynamic_partitions
BOARD_ONEPLUS_DYNAMIC_PARTITIONS_SIZE := 7511998464
BOARD_ONEPLUS_DYNAMIC_PARTITIONS_PARTITION_LIST := \
    system \
    vendor \
    product
BOARD_EXT4_SHARE_DUP_BLOCKS := true
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
PRODUCT_BUILD_PRODUCT_IMAGE  := true
BOARD_VENDORIMAGE_PARTITION_SIZE := 973119488
BOARD_BOOTIMAGE_PARTITION_SIZE := 100663296
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3221225472
BOARD_PRODUCTIMAGE_PARTITION_SIZE := 1291284480
BOARD_ODMIMAGE_PARTITION_SIZE := 929792
BOARD_DTBOIMG_PARTITION_SIZE := 25165824

#BOARD_USES_ODMIMAGE := true
#PRODUCT_BUILD_ODM_IMAGE := true
#BOARD_ODMIMAGE_FILE_SYSTEM_TYPE := ext4
#BOARD_ODMIMAGE_PARTITION_SIZE := 1048576
#BOARD_BUILD_SUPER_IMAGE_BY_DEFAULT := true

# must be before including omni part
TARGET_BOOTANIMATION_SIZE := 1080p
AB_OTA_UPDATER := true

DEVICE_PACKAGE_OVERLAYS += device/oneplus/oneplus7pro/overlay/common
DEVICE_PACKAGE_OVERLAYS += device/oneplus/oneplus7pro/overlay/device
DEVICE_PACKAGE_OVERLAYS += device/oneplus/oneplus7t/overlay/device
DEVICE_PACKAGE_OVERLAYS += vendor/omni/overlay/CarrierConfig

# Inherit from our custom product configuration
$(call inherit-product, vendor/omni/config/common.mk)

# get the rest of aosp stuff after ours
$(call inherit-product, $(SRC_TARGET_DIR)/product/mainline_system_arm64.mk)

# Inherit from hardware-specific part of the product configuration
$(call inherit-product, device/oneplus/oneplus7t/device.mk)

ALLOW_MISSING_DEPENDENCIES := true

PRODUCT_SHIPPING_API_LEVEL := 29

# Discard inherited values and use our own instead.
PRODUCT_NAME := omni_oneplus7t
PRODUCT_DEVICE := oneplus7t
PRODUCT_BRAND := OnePlus
PRODUCT_MANUFACTURER := OnePlus
PRODUCT_MODEL := HD1903

TARGET_DEVICE := OnePlus7T
PRODUCT_SYSTEM_NAME := OnePlus7T

VENDOR_RELEASE := 10/QKQ1.190716.003/1910122101:user/release-keys
BUILD_FINGERPRINT := OnePlus/OnePlus7T_EEA/OnePlus7T:$(VENDOR_RELEASE)
OMNI_BUILD_FINGERPRINT := OnePlus/OnePlus7T_EEA/OnePlus7T:$(VENDOR_RELEASE)
OMNI_PRIVATE_BUILD_DESC := "'OnePlus7T_EEA-user 10 QKQ1.190716.003 1910122101 release-keys'"

PLATFORM_SECURITY_PATCH_OVERRIDE := 2019-09-05

TARGET_VENDOR := oneplus

$(call inherit-product, vendor/oneplus/oneplus7t/oneplus7t-vendor.mk)
