# use AOSP default sounds
PRODUCT_PROPERTY_OVERRIDES += \
  ro.config.ringtone=Themos.ogg \
  ro.config.notification_sound=Proxima.ogg \
  ro.config.alarm_alert=Cesium.ogg

# TeamDRH

# Replace CM9 files
PRODUCT_COPY_FILES += \
    vendor/drh/prebuilt/common/bin/backuptool.sh:system/bin/backuptool.sh \
    vendor/drh/prebuilt/common/etc/sysctl.conf:system/etc/sysctl.conf

ifneq ($(TEAMDRH_BOOTANIMATION_NAME),)
    PRODUCT_COPY_FILES += \
        vendor/drh/prebuilt/common/bootanimation/$(TEAMDRH_BOOTANIMATION_NAME).zip:system/media/bootanimation.zip
else
    PRODUCT_COPY_FILES += \
        vendor/drh/prebuilt/common/bootanimation/HDPI.zip:system/media/bootanimation.zip
endif
    
# TeamDRH Extra Product Packages
#PRODUCT_PACKAGES += \

# CyanogenMod Packages
PRODUCT_PACKAGES += \
    Superuser \
    Superuser.apk \
    su

# TeamDRH Overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/drh/overlay/common
PRODUCT_PACKAGE_OVERLAYS += vendor/drh/overlay/teamdrh
PRODUCT_PACKAGE_OVERLAYS += vendor/drh/overlay/ui
PRODUCT_PACKAGE_OVERLAYS += vendor/drh/overlay/$(TARGET_PRODUCT)

DRH_VERSION_MAJOR = JB
DRH_VERSION_MINOR = Alpha
DRH_VERSION_MAINTENANCE = 1.0.0

TARGET_CUSTOM_RELEASETOOL := vendor/drh/tools/squisher

CM_VERSION := TEAMDRH
DRH_VERSION := $(CM_VERSION)-$(TARGET_PRODUCT)-$(DRH_VERSION_MAJOR)-$(DRH_VERSION_MINOR)-$(DRH_VERSION_MAINTENANCE)-$(shell date +%0d%^b%Y-%H%M%S)

PRODUCT_PROPERTY_OVERRIDES += \
  ro.cm.version=$(CM_VERSION) \
  ro.modversion=$(CM_VERSION) \
  ro.drh.version=$(DRH_VERSION)
