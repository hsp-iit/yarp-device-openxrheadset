# yarp-device-openxrheadset


`openxrheadset` YARP Device Driver for OpenXR-based headsets.

# Installation

## Using conda

The `yarp-device-openxrheadset` binary package is available from the `robotology` channel, to create a new environment that contains it run:

~~~
conda create -n yarpopenxrdev -c conda-forge -c robotology yarp-device-openxrheadset
~~~

## Using pixi

If you just want to use the already-packaged Windows build, you can install it with `pixi` without building this repository:

~~~
pixi global install --environment yarpopenxrdev --channel conda-forge --channel https://prefix.dev/robotology yarp-device-openxrheadset
~~~

If you want to package this fork and then install your forked build on Windows:

1. Install `pixi`.
2. From this repository, create the local environment once:

   ~~~
   pixi install
   ~~~

   This uses the `path = "."` package in `pixi.toml`, so Pixi builds the fork and reuses its cache instead of you manually rebuilding every time.

3. Build a redistributable conda package for the current platform:

   ~~~
   pixi run build-package
   ~~~

   This writes the built package to `dist/`.

4. Install the most recent built package into a named global Pixi environment:

   ~~~
   powershell -ExecutionPolicy Bypass -File scripts/install-pixi-package.ps1
   ~~~

   By default this creates/updates the `yarp-openxrheadset` Pixi global environment.

## From source

Make sure to install the required dependencies:
- C++ compiler
- CMake
- ycm-cmake-modules
- YARP
- OpenXR
- GLEW
- GLM
- Eigen3

Then install as any other CMake project:

~~~
git clone https://github.com/ami-iit/yarp-device-openxrheadset
cd yarp-device-openxrheadset
cmake -Bbuild -S.
cmake --build build
cmake --install build
~~~
