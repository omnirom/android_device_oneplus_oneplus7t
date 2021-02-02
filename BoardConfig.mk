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
DEVICE_PATH := device/oneplus/oneplus7t

ifeq ($(TARGET_DEVICE),oneplus7t)
TARGET_OTA_ASSERT_DEVICE := OnePlus7T
endif

ifeq ($(TARGET_DEVICE),oneplus7t)
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth
endif

ifeq ($(TARGET_DEVICE),oneplus7t)
OMNI_PRODUCT_PROPERTIES += \
    ro.sf.lcd_density=420
endif

include device/oneplus/oneplus7pro/BoardConfig.mk

# AVB
# Enable chain partition for system and product
BOARD_AVB_VBMETA_SYSTEM := system product
BOARD_AVB_VBMETA_SYSTEM_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_VBMETA_SYSTEM_ALGORITHM := SHA256_RSA2048
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX_LOCATION := 1

BOARD_KERNEL_CMDLINE += androidboot.boot_devices=soc/1d84000.ufshc

PRODUCT_SOONG_NAMESPACES += $(DEVICE_PATH)
PRODUCT_SOONG_NAMESPACES += vendor/oneplus/oneplus7t
PRODUCT_SOONG_NAMESPACES += vendor/qcom/opensource/commonsys/system/bt/conf

TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop
TARGET_COPY_OUT_PRODUCT := product
TARGET_COPY_OUT_ODM := odm
BOARD_PLAT_PRIVATE_SEPOLICY_DIR += $(DEVICE_PATH)/sepolicy/private

TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery_dynamic_partition.fstab
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_USES_FULL_RECOVERY_IMAGE := true
TARGET_RECOVERY_UI_SCREEN_WIDTH := 1080
TARGET_RECOVERY_UI_MARGIN_WIDTH := 30
TARGET_RECOVERY_UI_FONT := $(DEVICE_PATH)/recovery/font.png