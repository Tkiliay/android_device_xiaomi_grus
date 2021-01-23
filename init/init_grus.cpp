// Copyright (C) 2021-2022 The LineageOS Project
// SPDX-License-Identifier: Apache-2.0

#include <cstdio>

#include <android-base/properties.h>
#define _REALLY_INCLUDE_SYS__SYSTEM_PROPERTIES_H_
#include <sys/stat.h>
#include <sys/types.h>
#include <sys/_system_properties.h>

#include "vendor_init.h"

void property_override(char const prop[], char const value[])
{
    prop_info *pi;

    pi = (prop_info*) __system_property_find(prop);
    if (pi)
        __system_property_update(pi, value, strlen(value));
    else
        __system_property_add(prop, strlen(prop), value, strlen(value));
}

#define MAX_PROP_LIST 7
void property_override_multiple(std::string type, char const value[])
{
    std::string prop_list[MAX_PROP_LIST] = {
        "ro.product.",
        "ro.product.odm.",
        "ro.product.product.",
        "ro.product.system.",
        "ro.product.system_ext.",
        "ro.product.vendor.",
        "ro.vendor.product.",
    };

    for (int i = 0; i < MAX_PROP_LIST; i++)
        property_override((char *)&(prop_list[i] + type)[0], value);
}

/* From Magisk@jni/magiskhide/hide_utils.c */
static const char *snet_prop_key[] = {
    "ro.boot.vbmeta.device_state",
    "ro.boot.verifiedbootstate",
    "ro.boot.flash.locked",
    "ro.boot.selinux",
    "ro.boot.veritymode",
    "ro.boot.warranty_bit",
    "ro.warranty_bit",
    "ro.debuggable",
    "ro.secure",
    "ro.build.type",
    "ro.build.tags",
    "ro.build.selinux",
    NULL
};

static const char *snet_prop_value[] = {
    "locked",
    "green",
    "1",
    "enforcing",
    "enforcing",
    "0",
    "0",
    "0",
    "1",
    "user",
    "release-keys",
    "1",
    NULL
};

static void workaround_snet_properties() {
    // Hide all sensitive props
    for (int i = 0; snet_prop_key[i]; ++i) {
        property_override(snet_prop_key[i], snet_prop_value[i]);
    }
}

void vendor_load_properties()
{
    property_override_multiple("name", "grus");
    property_override_multiple("model", "Mi 9 SE");
    property_override("ro.build.description",
        "grus-user 11 RKQ1.200826.002 V12.5.1.0.RFBMIXM release-keys");
    property_override("ro.build.fingerprint",
        "Xiaomi/grus/grus:11/RKQ1.200826.002/V12.5.1.0.RFBMIXM:user/release-keys");
    property_override("ro.build.version.security_patch", "2021-04-01");

    /* for HD on Amazon Prime Video
    property_override_multiple("model", "Mi 10");
    property_override("ro.build.description",
        "umi-user 11 RKQ1.200826.002 V12.5.1.0.RJBMIXM release-keys");
    property_override("ro.build.fingerprint",
        "Xiaomi/umi_global/umi:11/RKQ1.200826.002/V12.5.1.0.RJBMIXM:user/release-keys");
    property_override("ro.build.version.security_patch", "2021-04-01");
    */

    workaround_snet_properties();
}
