#!/usr/bin/env bash
# Install the BC-250 ACPI table overrides from https://github.com/e-tho/bc250-acpi-fix.
# dracut packs them into the early initramfs (see 90-bc250-acpi-override.conf);
# the initramfs module in recipe.yml must run after this script.
# To update: bump VERSION and replace the checksums with those of the new release assets.
set -euo pipefail

VERSION="v1.1.1"
BASE_URL="https://github.com/e-tho/bc250-acpi-fix/releases/download/${VERSION}"
DEST="/usr/lib/bc250-acpi-fix"

declare -A SHA256=(
  [SSDT-CPU.aml]=9cfc1a254ea8814988d5a700e2dba8ebbe4f290a3895435512ea8afa3ba6a46f
  [SSDT-PST.aml]=cb3c96c622d2d653777020283c434f92c26bf2c83502a27d9a398f98424a771f
  [SSDT-STUBS.aml]=c219ce775476725d49739024e149556228436a1c3faf0768a7c3eff9d85f66c2
)

mkdir -p "${DEST}"
for table in "${!SHA256[@]}"; do
  curl -fsSL --retry 3 -o "${DEST}/${table}" "${BASE_URL}/${table}"
  echo "${SHA256[$table]}  ${DEST}/${table}" | sha256sum -c -
done
chmod 0644 "${DEST}"/*.aml
echo "Installed BC-250 ACPI tables ${VERSION} to ${DEST}"
