#!/usr/bin/env bash

set -xe

export PKG_CONFIG_PATH="${PREFIX}/lib/pkgconfig"

if [[ "$(uname)" == "Darwin" ]]; then
    export CXXFLAGS="-isystem $PREFIX/include -fPIC -fstack-protector-strong -stdlib=libc++"
fi

./meson.py build --prefix=${PREFIX} -Denable-openblas=true -Denable-pywrapper=true -Denable-autodiff=true -Denable-directdiff=true

./ninja -C build install
