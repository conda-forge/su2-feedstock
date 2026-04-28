#!/usr/bin/env bash

set -xe

export PKG_CONFIG_PATH="${PREFIX}/lib/pkgconfig"
MARCH="native"
if test ${HOST} == "aarch64-conda-linux-gnu"; then
  MARCH="armv8.4-a"
fi

./meson.py build --prefix=${PREFIX} -Dcpu-arch=${MARCH} -Denable-openblas=true -Denable-pywrapper=true -Denable-autodiff=true -Denable-directdiff=true

./ninja -C build install
