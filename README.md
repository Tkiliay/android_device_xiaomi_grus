The Xiaomi Mi 9 SE (codenamed _"grus"_) is a middle-ranged smartphone from Xiaomi.

It was announced in Febraury 2019. Release date was March 2019.

## Device specifications

Basic        | Spec Sheet
------------:|:-------------------------
SoC          | Qualcomm SDM712 Snapdragon 712
CPU          | Octa-core (2x2.3 GHz Kryo 360 Gold & 6x1.7 GHz Kryo 360 Silver)
GPU          | Adreno 616
Memory       | 6 GB RAM
Shipped Android Version | 9 with MIUI 10
Storage      | 64/128 GB
Battery      | Non-removable Li-Pol 3070 mAh battery
Display      | 1080 x 2340 pixels, 19.5:9 ratio, 5.97 inches, Super AMOLED (~432 ppi density)
Rear Camera  | 48 MP (wide) + 13 MP (ultrawide) + 8 MP (portrait), PDAF, dual-LED (dual tone) flash

## Device picture

![Xiaomi Mi 9 SE](https://wiki.lineageos.org/images/devices/grus.png)

***

## For building LineageOS 19
Create '.repo/local_manifests/roomservice.xml' with the following content:
```
<?xml version="1.0" encoding="UTF-8"?>
<manifest>

  <project name="LineageOS/android_hardware_xiaomi" path="hardware/xiaomi" remote="github" />

  <project name="kyasu/android_kernel_xiaomi_sdm710" path="kernel/xiaomi/sdm710" remote="github" />
  <project name="kyasu/android_device_xiaomi_grus" path="device/xiaomi/grus" remote="github" />
  <project name="kyasu/android_vendor_xiaomi_grus" path="vendor/xiaomi/grus" remote="github" />

</manifest>
```
