# Build Vision Five 2

Builds the Starfive Vision Five 2 kernel for as an arch package. The build steps rely on lxc as the build environment.

## Instructions
Setup container, install dependencies, build the kernel and delete the container. The resulting pacakges will be stored here.
```
./full_build.sh
```

These scripts assume that lxc has already been configured. If you haven't done so, the instructions for Arch Linux can be found at https://wiki.archlinux.org/title/LXD

## Independent scripts
### 01-setup.sh
Setup the container, create user and install minimal packages.
### 02-build.sh
Grab source code, install build dependecies, build the kernel.
### 03-clean.sh
Delete the container. Warning: if you created this container, it will not be retained.
