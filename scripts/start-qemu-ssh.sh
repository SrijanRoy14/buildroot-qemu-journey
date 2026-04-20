#!/bin/sh

BINARIES_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$BINARIES_DIR" || exit 1

export PATH="/home/errorr/projects/emli/external/output/qemu_aarch64_br/host/bin:$PATH"

exec qemu-system-aarch64 \
  -M virt \
  -cpu cortex-a53 \
  -nographic \
  -smp 1 \
  -kernel Image \
  -append "rootwait root=/dev/vda console=ttyAMA0" \
  -netdev user,id=net0,hostfwd=tcp::2222-:22 \
  -device virtio-net-device,netdev=net0 \
  -drive file=rootfs.ext4,if=virtio,format=raw
