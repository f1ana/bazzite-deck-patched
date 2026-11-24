# bazzite-deck-patched &nbsp; [![bluebuild build badge](https://github.com/f1ana/bazzite-deck-patched/actions/workflows/build.yml/badge.svg)](https://github.com/f1ana/bazzite-deck-patched/actions/workflows/build.yml)

Bazzite Deck image for AMD BC-250 boards with [cyan-skillfish-governor](https://github.com/filippor/cyan-skillfish-governor) included.

The [BC-250 ACPI table fixes](https://github.com/e-tho/bc250-acpi-fix) (CPU idle states and frequency scaling, 6- and 8-core) are built into the image's initramfs. Remove any manually installed ACPI override (`GRUB_EARLY_INITRD_LINUX_CUSTOM` / `/boot/*.cpio`) before rebasing, since duplicate tables fail to load. To update the tables, bump `VERSION` and the checksums in `files/scripts/bc250-acpi-tables.sh`.
## Installation

To rebase an existing Bazzite installation to this latest build:

- Rebase to the signed image, like so:
  ```
  rpm-ostree rebase ostree-image-signed:docker://ghcr.io/f1ana/bazzite-deck-patched:latest
  ```
- Reboot to complete the installation
  ```
  systemctl reboot
  ```

The `latest` tag will automatically point to the latest build. That build will still always use the Bazzite version specified in `recipe.yml`, so you won't get accidentally updated to the next major version.

## ISO

You can generate an offline ISO with the instructions available [here](https://blue-build.org/learn/universal-blue/#fresh-install-from-an-iso).

## Verification

These images are signed with [Sigstore](https://www.sigstore.dev/)'s [cosign](https://github.com/sigstore/cosign). You can verify the signature by downloading the `cosign.pub` file from this repo and running the following command:

```bash
cosign verify --key cosign.pub ghcr.io/f1ana/bazzite-deck-patched
```
