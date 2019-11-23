# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017 The LineageOS Project
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

# Prebuilt
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,device/oneplus/oneplus7pro/prebuilt/product,product) \
    $(call find-copy-subdir-files,*,device/oneplus/oneplus7pro/prebuilt/root,recovery/root)

PRODUCT_COPY_FILES += \
    device/oneplus/oneplus7t/fstab.qcom:$(TARGET_COPY_OUT_RECOVERY)/root/first_stage_ramdisk/fstab.qcom

$(call inherit-product, device/oneplus/oneplus7pro/device.mk)

AB_OTA_PARTITIONS += \
    product \
    vbmeta_system

# Fingerprint
PRODUCT_PACKAGES += \
    omni.biometrics.fingerprint.inscreen@1.0-service.oneplus7t
