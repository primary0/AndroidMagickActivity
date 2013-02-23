# C                  opyrieht (C) 2009 The Android Open Source Project
#                    
# L                  icensed under the Apache License, Version 2.0 (the "License");
# y                  ou may not use this file except in compliance with the License.
# Y                  ou may obtain a copy of the License at
#                    
#                        http://www.apache.org/licenses/LICENSE-2.0
#                    
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

NDK_MODULE_PATH := $(LOCAL_PATH)/../ndk-modules
MAGIC_HOME := $(LOCAL_PATH)/../ndk-modules/ImageMagick-6.7.3-0
LOCAL_MODULE    := android-magick
LOCAL_SRC_FILES := jmagick.c
LOCAL_SRC_FILES += magick_DrawInfo.c
LOCAL_SRC_FILES += magick_ImageInfo.c
LOCAL_SRC_FILES += magick_Magick.c
LOCAL_SRC_FILES += magick_MagickImage.c
LOCAL_SRC_FILES += magick_MagickInfo.c
LOCAL_SRC_FILES += magick_MontageInfo.c
LOCAL_SRC_FILES += magick_PixelPacket.c
LOCAL_SRC_FILES += magick_QuantizeInfo.c \
				   magick_MagickBitmap.c

LOCAL_C_INCLUDES += $(MAGIC_HOME)
LOCAL_C_INCLUDES += $(NDK_MODULE_PATH)/jpeg
LOCAL_C_INCLUDES += $(NDK_MODULE_PATH)/tiff
LOCAL_CFLAGS += $(MAGIC_HOME)
LOCAL_STATIC_LIBRARIES := MagickCore jpeg coders tiff-static filters
LOCAL_SHARED_LIBRARIES += MagickCore jpeg coders tiff-static filters png15 bz2 gomp pthread
LOCAL_LDLIBS += -L$(LOCAL_PATH)/../lib -lz -lfreetype -lpng -llog

include $(BUILD_SHARED_LIBRARY)

$(call import-add-path,$(NDK_MODULE_PATH))
$(call import-add-path,$(LOCAL_PATH)/../ndk-modules/jpeg)
$(call import-module,ImageMagick-6.7.3-0)
$(call import-module,jpeg)
$(call import-module,tiff)
