#!/bin/sh
export LDFLAGS="-L/mnt/slm/db4/lib/ ${LDFLAGS}"
export CPPFLAGS="-I/mnt/slm/db4/include/ ${CPPFLAGS}"
./configure --with-gui=qt5 --disable-tests --disable-bench --prefix=/mnt/slm/slimcoin/depends/x86_64-w64-mingw32