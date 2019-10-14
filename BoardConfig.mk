#
# Copyright 2019 The Android Open Source Project
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

# This contains the module build definitions for the hardware-specific
# components for this device.
#
# As much as possible, those components should be built unconditionally,
# with device-specific names to avoid collisions, to avoid device-specific
# bitrot and build breakages. Building a component unconditionally does
# *not* include it on all devices, so it is safe even with hardware-specific
# components.

LOCAL_PATH := device/huawei/hi6250

# 64 Bit
TARGET_USES_64_BIT_BINDER := true

# Architecture
ARCH_ARM_HAVE_TLS_REGISTER := true
ARCH_ARM_HAVE_NEON := true
ARCH_ARM_HIGH_OPTIMIZATION := true

TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a53
TARGET_CPU_SMP := true

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

# Assert
TARGET_OTA_ASSERT_DEVICE := hi6250

# Audio
BOARD_SUPPORTS_SOUND_TRIGGER := true
BOARD_USES_ALSA_AUDIO := true
BOARD_USES_GENERIC_AUDIO := false
TARGET_PROVIDES_LIBAUDIO := true

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/bluetooth
BOARD_HAVE_BLUETOOTH := true

# Board
BOARD_VENDOR_PLATFORM := hi6250
TARGET_BOARD_PLATFORM := hi6250

# Bootanimation
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := hi6250
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
TARGET_NO_RPC := true

# Camera
USE_DEVICE_SPECIFIC_CAMERA := true

# Charger
BACKLIGHT_PATH := /sys/class/leds/lcd_backlight0/brightness
BOARD_CHARGER_DISABLE_INIT_BLANK := true

# CMHW
BOARD_HARDWARE_CLASS := \
    $(LOCAL_PATH)/cmhw \
    hardware/cyanogen/cmhw

# CPU
ENABLE_CPUSETS := true
ENABLE_SCHEDBOOST := true

# File System
BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# GPS
USE_DEVICE_SPECIFIC_GPS := true

# Graphics
ANDROID_ENABLE_RENDERSCRIPT := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 6
TARGET_HARDWARE_3D := true
TARGET_USES_ION := true
USE_OPENGL_RENDERER := true

# Init
TARGET_INIT_VENDOR_LIB := libinit_hi6250
TARGET_LIBINIT_DEFINES_FILE := $(LOCAL_PATH)/init/init_berlin.cpp
TARGET_UNIFIED_DEVICE := true

# Kernel
BOARD_KERNEL_BASE := 0x00478000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_CMDLINE := loglevel=4 coherent_pool=512K page_tracker=on slub_min_objects=12 androidboot.selinux=permissive
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x00008000 --ramdisk_offset 0x07b88000 --tags_offset 0x07588000

TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_CROSS_COMPILE_PREFIX := aarch64-linux-android-
TARGET_KERNEL_HEADER_ARCH := arm64


TARGET_KERNEL_CONFIG := merge_hi6250_defconfig
TARGET_KERNEL_SOURCE := kernel/huawei/hi6250

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_CACHEIMAGE_PARTITION_SIZE := 268435456
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3154116608
BOARD_USERDATAIMAGE_PARTITION_SIZE := 25983713280

BOARD_NEEDS_VENDORIMAGE_SYMLINK := true
TARGET_COPY_OUT_VENDOR := system

# Properties
TARGET_SYSTEM_PROP := $(LOCAL_PATH)/system.prop

# Recovery
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/rootdir/fstab.hi6250

# RIL
TARGET_GLOBAL_CFLAGS += -DDISABLE_ASHMEM_TRACKING
BOARD_RIL_CLASS := ../../../device/huawei/hi6250/ril
PROTOBUF_SUPPORTED := true
TARGET_RIL_VARIANT := proprietary

# WebGL
ENABLE_WEBGL := true

# Sepolicy
BOARD_SEPOLICY_DIRS += \
	device/huawei/hi6250/sepolicy

# Wifi
WPA_SUPPLICANT_VERSION          := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER 	:= NL80211
BOARD_HOSTAPD_DRIVER 		:= NL80211
CONFIG_DRIVER_NL80211		:= y

-include vendor/huawei/hi6250/BoardConfigVendor.mk
