# yarp-device-openxrheadset


`openxrheadset` YARP Device Driver for OpenXR-based headsets.

# Installation

## Using conda

The `yarp-device-openxrheadset` binary package is available from the `robotology` channel, to create a new environment that contains it run:

~~~
conda create -n yarpopenxrdev -c conda-forge -c robotology yarp-device-openxrheadset
~~~

## From source

Make sure to install the required dependencies:
- C++ compiler
- CMake
- ycm-cmake-modules
- YARP 4 built from the `robotology/yarp` repository
- OpenXR
- GLEW
- GLM
- Eigen3

YARP 4 is not available yet as a released Pixi/conda package. Build and install
YARP from source first, then point this project to the YARP installation prefix
or to the directory that contains `YARPConfig.cmake`.

~~~
git clone https://github.com/ami-iit/yarp-device-openxrheadset
cd yarp-device-openxrheadset
cmake -Bbuild -S. -DYARP_OPENXR_YARP_SOURCE_PREFIX=<path-to-yarp-install-prefix>
cmake --build build
cmake --install build
~~~

Alternatively, pass `-DYARP_DIR=<path-containing-YARPConfig.cmake>` or set
`CMAKE_PREFIX_PATH` to the YARP install prefix before configuring.

When using Pixi for the local development environment:

~~~
pixi run yarp version
pixi run cmake -Bbuild -S. -DYARP_OPENXR_YARP_SOURCE_PREFIX=<path-to-yarp-install-prefix>
pixi run cmake --build build --config Release
~~~

The Pixi package build is intentionally not constrained to the released `yarp`
conda package, because the currently released package is still YARP 3. Until a
YARP 4 package is published, package builds need access to a source-built YARP 4
prefix through `YARP_OPENXR_YARP_SOURCE_PREFIX`, `YARP_DIR`, or
`CMAKE_PREFIX_PATH`.
