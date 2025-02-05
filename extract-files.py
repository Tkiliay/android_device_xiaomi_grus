#!/usr/bin/env -S PYTHONPATH=../../../tools/extract-utils python3
#
# SPDX-FileCopyrightText: 2024 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

from extract_utils.fixups_blob import (
    blob_fixup,
    blob_fixups_user_type,
)

from extract_utils.fixups_lib import (
    lib_fixup_remove,
    lib_fixups,
    lib_fixups_user_type,
)

from extract_utils.main import (
    ExtractUtils,
    ExtractUtilsModule,
)

namespace_imports = [
    'hardware/qcom/sdm845',
    'hardware/xiaomi',
    'vendor/xiaomi/sdm710-common',
]

def lib_fixup_vendor_suffix(lib: str, partition: str, *args, **kwargs):
    return f'{lib}_{partition}' if partition == 'vendor' else None

lib_fixups: lib_fixups_user_type = {
    **lib_fixups,
}

blob_fixups: blob_fixups_user_type = {
    'vendor/lib/hw/audio.primary.grus.so': blob_fixup()
        .binary_regex_replace(b'/vendor/lib/liba2dpoffload\\.so', b'liba2dpoffload_grus.so\x00\x00\x00\x00\x00\x00\x00')
        .binary_regex_replace(b'/vendor/lib/libssrec\\.so', b'libssrec_grus.so\x00\x00\x00\x00\x00\x00\x00'),
}  # fmt: skip

module = ExtractUtilsModule(
    'grus',
    'xiaomi',
    blob_fixups=blob_fixups,
    lib_fixups=lib_fixups,
    namespace_imports=namespace_imports,
)

if __name__ == '__main__':
    utils = ExtractUtils.device_with_common(module, 'sdm710-common', module.vendor)
    utils.run()
