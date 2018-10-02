#!/bin/sh
mkdir build && cd build

if [ "$cuda_impl" == "cuda" ]; then
    export LDFLAGS="$LDFLAGS -L$(dirname $(dirname $(which nvcc)))/lib64 -lcublas -lcudart"
fi

cmake -G "Ninja"                                    \
    -DCMAKE_INSTALL_PREFIX=${PREFIX}                \
    -DCMAKE_BUILD_TYPE=Release                      \
    -DEIGEN_INCLUDE_DIR=${PREFIX}/include/eigen3    \
    -DLIBRT_LIBRARY=${PREFIX}/lib/libmkl_rt.so      \
    -DBUILD_TESTING=OFF                             \
    ..

ninja install
