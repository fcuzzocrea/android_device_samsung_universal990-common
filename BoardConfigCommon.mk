#
# Copyright (C) 2023 The LineageOS Project
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

COMMON_PATH := device/samsung/universal990-common

# Include path
TARGET_SPECIFIC_HEADER_PATH := $(COMMON_PATH)/include

# APEX
DEXPREOPT_GENERATE_APEX_IMAGE := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-2a-dotprod
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a76

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-2a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a55

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_CUSTOM_BT_CONFIG := $(COMMON_PATH)/bluetooth/libbt_vndcfg.txt

# Compatibility Matrix
DEVICE_MATRIX_FILE := $(COMMON_PATH)/compatibility_matrix.xml

# Dexpreopt
ifeq ($(HOST_OS),linux)
  ifneq ($(TARGET_BUILD_VARIANT),eng)
    WITH_DEXPREOPT_BOOT_IMG_AND_SYSTEM_SERVER_ONLY ?= false
    WITH_DEXPREOPT := true
  endif
endif

# Dynamic Partitions
BOARD_SAMSUNG_DYNAMIC_PARTITIONS_SIZE := 9432989696
BOARD_SAMSUNG_DYNAMIC_PARTITIONS_PARTITION_LIST := system system_ext vendor product odm
BOARD_SUPER_PARTITION_GROUPS := samsung_dynamic_partitions
BOARD_SUPER_PARTITION_SIZE := 9437184000

ifneq ($(WITH_GMS),true)
  BOARD_PRODUCTIMAGE_PARTITION_RESERVED_SIZE := 1258291200
  BOARD_PRODUCTIMAGE_EXTFS_INODE_COUNT := -1
  BOARD_SYSTEMIMAGE_PARTITION_RESERVED_SIZE := 1258291200
  BOARD_SYSTEMIMAGE_EXTFS_INODE_COUNT := -1
  BOARD_SYSTEM_EXTIMAGE_PARTITION_RESERVED_SIZE := 1258291200
  BOARD_SYSTEM_EXTIMAGE_EXTFS_INODE_COUNT := -1
endif

# DTB
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_DTB_CFG := $(COMMON_PATH)/configs/kernel/exynos990.cfg

# DTBO
BOARD_KERNEL_SEPARATED_DTBO := true
BOARD_DTBO_CFG := $(COMMON_PATH)/configs/kernel/$(TARGET_DEVICE).cfg

# Filesystem
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_ODMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_ODM := odm
TARGET_COPY_OUT_PRODUCT := product
TARGET_COPY_OUT_SYSTEM_EXT := system_ext
TARGET_COPY_OUT_VENDOR := vendor
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Firmware
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# Framework Matrix
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE := $(COMMON_PATH)/device_framework_matrix.xml
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += vendor/lineage/config/device_framework_matrix.xml

# HIDL Manifest
DEVICE_MANIFEST_FILE := $(COMMON_PATH)/manifest.xml

# Kernel
BOARD_KERNEL_IMAGE_NAME := Image
BOARD_BOOTIMG_HEADER_VERSION := 2
BOARD_CUSTOM_BOOTIMG := true
BOARD_MKBOOTIMG_ARGS := --base 0x10000000 --pagesize 2048 --dtb_offset 0x00000000 --kernel_offset 0x00008000 --ramdisk_offset 0x01000000 --tags_offset 0x00000100  --header_version 2  
#BOARD_KERNEL_CMDLINE := The bootloader ignores the cmdline from the boot.img
BOARD_KERNEL_PAGESIZE := 2048
TARGET_KERNEL_CLANG_VERSION := r416183b
TARGET_KERNEL_CLANG_PATH := $(abspath .)/prebuilts/clang/kernel/$(HOST_PREBUILT_TAG)/clang-$(TARGET_KERNEL_CLANG_VERSION)
TARGET_KERNEL_LLVM_BINUTILS := false
TARGET_KERNEL_SOURCE := kernel/samsung/universal990

# Keymaster
TARGET_KEYMASTER_VARIANT := samsung

# Metadata
BOARD_USES_METADATA_PARTITION := true

# LMKD stats logging
TARGET_LMKD_STATS_LOG := true

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 61865984
BOARD_CACHEIMAGE_PARTITION_SIZE := 629145600
BOARD_DTBOIMG_PARTITION_SIZE := 8388608
BOARD_FLASH_BLOCK_SIZE := 4096
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 69009408
BOARD_ROOT_EXTRA_FOLDERS := efs

# Platform
BOARD_VENDOR := samsung
TARGET_BOARD_PLATFORM := universal990
TARGET_BOOTLOADER_BOARD_NAME := exynos990
TARGET_SOC := exynos990

# Properties
TARGET_SYSTEM_PROP += $(COMMON_PATH)/system.prop
TARGET_VENDOR_PROP += $(COMMON_PATH)/vendor.prop

# Recovery
BOARD_HAS_DOWNLOAD_MODE := true
BOARD_INCLUDE_RECOVERY_DTBO := true
BOARD_USES_FULL_RECOVERY_IMAGE := true
TARGET_RECOVERY_FSTAB := $(COMMON_PATH)/ramdisk/etc/fstab.exynos990
TARGET_RECOVERY_PIXEL_FORMAT := "ABGR_8888"

# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := $(COMMON_PATH)/releasetools

# RIL
ENABLE_VENDOR_RIL_SERVICE := true

# SECComp filters
BOARD_SECCOMP_POLICY += $(COMMON_PATH)/seccomp

# Security
VENDOR_SECURITY_PATCH := 2023-03-01

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3
BOARD_AVB_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA4096
BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := 1
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1

# Wi-Fi
BOARD_WLAN_BCMDHD_SAE                         := true
BOARD_WLAN_DEVICE                             := bcmdhd
BOARD_WPA_SUPPLICANT_DRIVER                   := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB              := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER                          := NL80211
BOARD_HOSTAPD_PRIVATE_LIB                     := lib_driver_cmd_bcmdhd
CONFIG_IEEE80211AX                            := true
WIFI_AVOID_IFACE_RESET_MAC_CHANGE             := true
WIFI_FEATURE_HOSTAPD_11AX                     := true
WIFI_HIDL_FEATURE_AWARE                       := true
WIFI_HIDL_FEATURE_DUAL_INTERFACE              := true
WIFI_HIDL_UNIFIED_SUPPLICANT_SERVICE_RC_ENTRY := true
WPA_SUPPLICANT_VERSION                        := VER_0_8_X

# Call Samsung LSI board support package
include hardware/samsung_slsi-linaro/config/BoardConfig990.mk

# Call the proprietary setup
include vendor/samsung/universal990-common/BoardConfigVendor.mk
