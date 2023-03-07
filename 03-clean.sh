#!/usr/bin/bash
INST=arch-visionfive2

lxc stop -f $INST
lxc delete $INST
