#!/usr/bin/bash
./01-setup.sh || exit $?
./02-build.sh || exit $?
./03-clean.sh || exit $?
