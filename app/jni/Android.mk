LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

$(call import-add-path,$(LOCAL_PATH)/../../cocos2d)
$(call import-add-path,$(LOCAL_PATH)/../../cocos2d/external)
$(call import-add-path,$(LOCAL_PATH)/../../cocos2d/cocos)
$(call import-add-path,$(LOCAL_PATH)/../../cocos2d/cocos/audio/include)

LOCAL_MODULE := MyGame

LOCAL_MODULE_FILENAME := libMyGame

GAME_SRC_DIR := $(LOCAL_PATH)/../../Classes

LOCAL_SRC_FILES := hellocpp/main.cpp \
                   ../../proj.android/jni/Java_joaobapt_CommonAlertListener.cpp \
                   ../../proj.android/jni/Java_joaobapt_PictureDownloader.cpp \
                   ../../proj.android/jni/Java_joaobapt_MotionProcessor.cpp \
                   $(subst $(LOCAL_PATH)/,,$(wildcard $(GAME_SRC_DIR)/*.cpp))

LOCAL_SRC_FILES := $(filter-out ../../Classes/MotionProcessor-Backup.cpp,$(LOCAL_SRC_FILES))

LOCAL_C_INCLUDES := $(LOCAL_PATH)/../../Classes

# _COCOS_HEADER_ANDROID_BEGIN
# _COCOS_HEADER_ANDROID_END


LOCAL_STATIC_LIBRARIES := cocos2dx_static

# _COCOS_LIB_ANDROID_BEGIN
# _COCOS_LIB_ANDROID_END

include $(BUILD_SHARED_LIBRARY)

$(call import-module,.)

# _COCOS_LIB_IMPORT_ANDROID_BEGIN
# _COCOS_LIB_IMPORT_ANDROID_END
