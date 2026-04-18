# 🚀 My Buildroot Adventure

Welcome to my **Buildroot playground** — where I tinker, break things, fix them, and slowly stitch together the skills needed for real-world embedded Linux projects.

---

## 🌱 The Journey So Far
- Started with **cross-compilation basics** (hello world on AArch64).
- Learned to **inject binaries into rootfs** and boot them in QEMU.
- Explored **initramfs vs ext2/4 rootfs** and persistence.
- Built and ran **kernel modules** successfully (yes, they worked!).
- Set up **SSH into QEMU** and transferred my own programs.
- Played with **packages, configs, and Buildroot internals**.

---

## 🎯 What I Plan to Learn Next
- Init systems: BusyBox init vs systemd, and how to auto-start my apps.
- Filesystem overlays and A/B update layouts.
- Networking with virtio, Dropbear SSH, and secure remote workflows.
- Debugging with `strace`, `gdbserver`, and kernel logs.
- Profiling and monitoring with lightweight metrics exporters.
- CI pipelines, reproducible builds, and SBOM/license compliance.

---

## 🏁 The Big Goal
Tie everything together into an **Edge IoT Gateway Prototype**:
- A reproducible Buildroot image for AArch64.
- Custom sensor-agent service.
- Secure SSH access and OTA update simulation.
- Logging, monitoring, and CI automation.
- Documented workflow that feels industry-ready.

---

## 🎉 Outcome
By the end of this repo’s evolution, I’ll have:
- A clean external tree with reproducible configs.
- Scripts to boot QEMU and test my builds.
- A working demo that shows off my embedded Linux chops.
- A fun record of my Buildroot learning journey.

---

## ⚡ Motto
> Break it, fix it, learn it — repeat.  
> Every rebuild is a step closer to mastery.

