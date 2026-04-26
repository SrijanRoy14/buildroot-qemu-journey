#!/bin/sh
set -e
OUTPUT_DIR=~/projects/emli/external/output/qemu_aarch64_br
ROOTFS_IMG="$OUTPUT_DIR/images/rootfs.ext4"
KERNEL_IMG="$OUTPUT_DIR/images/Image"

exec qemu-system-aarch64 \
  -M virt \
  -cpu cortex-a53 \
  -nographic \
  -smp 1 \
  -kernel "$KERNEL_IMG" \
  -append "rootwait root=/dev/vda console=ttyAMA0" \
  -netdev user,id=net0,hostfwd=tcp::2222-:22 \
  -device virtio-net-device,netdev=net0 \
  -drive file="$ROOTFS_IMG",if=virtio,format=raw
