#!/bin/bash
set -e

# ===== CONFIG =====
OUTPUT_DIR=~/projects/emli/external/output/qemu_aarch64_br
MNT_DIR=~/mnt/rootfs
HELLO_SRC=palindrome.c
HELLO_BIN=palindrome-aarch64

TOOLCHAIN_BIN="$OUTPUT_DIR/host/bin/aarch64-linux-gcc"
SYSROOT="$OUTPUT_DIR/host/aarch64-buildroot-linux-gnu/sysroot"
ROOTFS_IMG="$OUTPUT_DIR/images/rootfs.ext4"
KERNEL_IMG="$OUTPUT_DIR/images/Image"

# ===== CLEANUP HANDLER =====
cleanup() {
    if mount | grep -q "$MNT_DIR"; then
        sudo umount "$MNT_DIR"
    fi

    if ls | grep -q "$HELLO_BIN"; then
        rm -f "$HELLO_BIN"
    fi
}
trap cleanup EXIT

echo "[1/4] Compiling for AArch64..."
$TOOLCHAIN_BIN --sysroot=$SYSROOT $HELLO_SRC -o $HELLO_BIN

echo "[2/4] Verifying binary..."
file $HELLO_BIN

echo "[3/4] Mounting rootfs and deploying binary..."
mkdir -p $MNT_DIR
sudo mount -o loop $ROOTFS_IMG $MNT_DIR

sudo cp $HELLO_BIN $MNT_DIR/usr/bin/
sudo chmod +x $MNT_DIR/usr/bin/$HELLO_BIN

echo "[4/4] Unmounting rootfs..."
sudo umount $MNT_DIR

echo "[5/5] Launching QEMU..."
qemu-system-aarch64 \
  -M virt \
  -cpu cortex-a53 \
  -nographic \
  -smp 1 \
  -kernel $KERNEL_IMG \
  -append "root=/dev/vda console=ttyAMA0" \
  -netdev user,id=net0,hostfwd=tcp::2222-:22 \
  -device virtio-net-device,netdev=net0 \
  -drive file=$ROOTFS_IMG,format=raw,if=virtio
