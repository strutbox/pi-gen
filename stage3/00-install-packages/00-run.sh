#!/bin/bash -e

wget "https://strutbox.storage.googleapis.com/strut" -O files/strut

install -m 644 files/strut.service		${ROOTFS_DIR}/etc/systemd/system/
install -m 744 files/strut				${ROOTFS_DIR}/usr/bin/

on_chroot << EOF
systemctl enable strut
systemctl enable ssh
EOF
