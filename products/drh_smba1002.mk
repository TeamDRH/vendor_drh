# Check for target product
ifeq (drh_smba1002,$(TARGET_PRODUCT))

# Define DRH bootanimation size
DRH_BOOTANIMATION_NAME := XHDPI

# include TeamDRH common configuration
include vendor/drh/config/drh_common.mk

# include additional files
#PRODUCT_COPY_FILES += \

# Inherit CM9 device configuration
$(call inherit-product, device/malata/smba1002/cm.mk)

PRODUCT_NAME := drh_smba1002

GET_VENDOR_PROPS := $(shell vendor/drh/tools/getvendorprops.py $(PRODUCT_NAME))

endif

