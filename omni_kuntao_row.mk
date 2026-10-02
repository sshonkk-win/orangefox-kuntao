# Inherit from common device configuration
$(call inherit-product, device/lenovo/kuntao_row/device.mk)

# Inherit some common Omni stuff
$(call inherit-product, vendor/omni/config/common.mk)
$(call inherit-product, build/target/product/embedded.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := kuntao_row
PRODUCT_NAME := omni_kuntao_row
PRODUCT_BRAND := Lenovo
PRODUCT_MODEL := Lenovo P2a42
PRODUCT_MANUFACTURER := LENOVO
PRODUCT_RELEASE_NAME := kuntao_row
