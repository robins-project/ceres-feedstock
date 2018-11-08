#!/bin/sh
mkdir build && cd build

if [ "$cuda_impl" == "cuda" ]; then
    export LDFLAGS="$LDFLAGS -L$(dirname $(dirname $(which nvcc)))/lib64 -lcublas -lcudart"
fi

cmake -G "Ninja"                                        \
    -DCMAKE_INSTALL_PREFIX=${PREFIX}                    \
    -DCMAKE_BUILD_TYPE=Release                          \
    -DCMAKE_INCLUDE_PATH=${PREFIX}/include              \
    -DCMAKE_LIBRARY_PATH=${PREFIX}/lib                  \
    -DEIGEN_INCLUDE_DIR_HINTS=${PREFIX}/include/eigen3  \
    -DBLA_VENDOR=Intel10_64lp                           \
    -DBUILD_TESTING=OFF                                 \
    ..

ninja install
