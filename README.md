# bazzite-deck-patched &nbsp; [![bluebuild build badge](https://github.com/f1ana/bazzite-deck-patched/actions/workflows/build.yml/badge.svg)](https://github.com/f1ana/bazzite-deck-patched/actions/workflows/build.yml)

Bazzite Deck image for AMD BC-250 boards with oberon-governor included.
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
