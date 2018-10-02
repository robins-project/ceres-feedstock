mkdir build
cd build

cmake -G "Ninja"                                ^
    -DCMAKE_INSTALL_PREFIX=${PREFIX}            ^
    -DCMAKE_BUILD_TYPE=Release                  ^
    -DEIGEN_INCLUDE_DIR=%LIBRARY_INC%/eigen3    ^
    ..

ninja install
