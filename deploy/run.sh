#!/usr/bin/env bash

qemu-system-x86_64 \
    -enable-kvm \
    -m 2G \
    -smp 2 \
    -nographic \
    -device virtio-net-pci,netdev=net0 \
    -netdev user,id=net0,hostfwd=tcp::2022-:2022,hostfwd=tcp::8080-:8080,hostfwd=tcp::4000-:4000 \
    -drive if=virtio,file=challenge.qcow2,format=qcow2
