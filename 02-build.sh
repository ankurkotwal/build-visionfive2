#!/usr/bin/bash
INST=arch-visionfive2

# Build kernel
lxc exec $INST --user 1000 -- bash -c "cd ~ && git clone https://github.com/thefossguy/linux-starfive-visionfive2.git kernel" || exit 1
lxc exec $INST --user 1000 -- bash -c "cd ~/kernel/ && makepkg -s --noconfirm" || exit 1
# Copy files back to host
PACKAGES=`lxc exec $INST --user 1000 -- bash -c "ls ~/kernel/linux-starfive-visionfive2-*.pkg.tar.zst"`
if [ ! -z "$PACKAGES" ]; then
  ARRAY=($PACKAGES)
  LXCFILES=(`printf "$INST%s " "${ARRAY[@]}"`)
fi
lxc file pull "${LXCFILES[@]}" .


