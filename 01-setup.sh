#!/usr/bin/bash
INST=arch-visionfive2

# Check if instance already exists
instances=`lxc list $INST | grep $INST`
if [ $? -eq 0 ]; then
  echo "ERROR: lxc not configured or instance $INST already exists."
  exit 1
fi

# Setup
lxc launch images:archlinux/current/amd64 $INST
sleep 5 # To let things settle
# Setup sudo and install needed packages
lxc exec $INST -- bash -c "sed -i \"s/# %wheel ALL=(ALL:ALL) NOPASSWD: ALL/%wheel ALL=(ALL:ALL) NOPASSWD: ALL/g\" /etc/sudoers" || exit 1
lxc exec $INST -- bash -c "yes | pacman -Syu base-devel git" || exit 1
# Add builder user
lxc exec $INST -- bash -c "useradd builder -m -G wheel" || exit 1
