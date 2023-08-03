# Addition Of Custom Delay Calculation Model In OpenSTA

## Overview 

In this project some changes have been made to the open source tool OpenSTA to accomodate any custom model for delay calculation. These changes allows the user to use any of the model that they want (their own custom model or the inbuilt model) and generate the report according to that model.

### Testing 

For testing the changes sample files have been added to the experiment directory. 

## Report 

A final report on OpenSTA which consists of a detiled analysis of how the software works and in particular how the delay calculation model works is attached by the name of "REPORT ON OPENSTA.pdf". This report also describes the changes that have been made to accomodate a custom delay model.

## Build

OpenSTA is built with CMake.

### Prerequisites

The build dependency versions are show below.  Other versions may
work, but these are the versions used for development.

```
         from   Ubuntu   Xcode
                22.04.2  11.3
cmake    3.10.2 3.24.2   3.16.2
clang    9.1.0           14.0.3
gcc      3.3.2   11.3.0  
tcl      8.4     8.6     8.6.6
swig     1.3.28  4.1.0   4.0.1
bison    1.35    3.0.2   3.8.2
flex     2.5.4   2.6.4   2.6.4
```

Note that flex versions before 2.6.4 contain 'register' declarations that
are illegal in c++17.

These packages are **optional**:

```
tclreadline                   2.3.8
libz        1.1.4   1.2.5     1.2.8
cudd                2.4.1     3.0.0
```

The [TCL readline library](https://tclreadline.sourceforge.net/tclreadline.html)
links the GNU readline library to the TCL interpreter for command line editing 
On OSX, Homebrew does not support tclreadline, but the macports system does
(see https://www.macports.org). To enable TCL readline support use the following
Cmake option:

```
cmake .. -DUSE_TCL_READLINE=ON
```

The Zlib library is an optional.  If CMake finds libz, OpenSTA can
read Verilog, SDF, SPF, and SPEF files compressed with gzip.

CUDD is a binary decision diageram (BDD) package that is used to
improve conditional timing arc handling. OpenSTA does not require it
to be installed. It is available
[here](https://www.davidkebo.com/source/cudd_versions/cudd-3.0.0.tar.gz)
or [here](https://sourceforge.net/projects/cudd-mirror/).

Note that the file hierarchy of the CUDD installation changed with version 3.0.
Some changes to CMakeLists.txt are required to support older versions.

Use the USE_CUDD option to look for the cudd library.
Use the CUDD_DIR option to set the install directory if it is not in
one of the normal install directories.

When building CUDD you may use the `--prefix ` option to `configure` to
install in a location other than the default (`/usr/local/lib`).
```
cd $HOME/cudd-3.0.0
mkdir $HOME/cudd
./configure --prefix $HOME/cudd
make
make install

cd <opensta>/build
cmake .. -DUSE_CUDD=ON -DCUDD_DIR=$HOME/cudd
```

### Installing with CMake

Use the following commands to checkout the git repository and build the
OpenSTA library and excutable.

```
git clone https://github.com/The-OpenROAD-Project/OpenSTA.git
cd OpenSTA
mkdir build
cd build
cmake ..
make
```
The default build type is release to compile optimized code.
The resulting executable is in `app/sta`.
The library without a `main()` procedure is `app/libSTA.a`.

Optional CMake variables passed as -D<var>=<value> arguments to CMake are show below.

```
CMAKE_BUILD_TYPE DEBUG|RELEASE
CMAKE_CXX_FLAGS - additional compiler flags
TCL_LIBRARY - path to tcl library
TCL_HEADER - path to tcl.h
CUDD - path to cudd installation
ZLIB_ROOT - path to zlib
CMAKE_INSTALL_PREFIX
```

If `TCL_LIBRARY` is specified the CMake script will attempt to locate
the header from the library path.

The default install directory is `/usr/local`.
To install in a different directory with CMake use:

```
cmake .. -DCMAKE_INSTALL_PREFIX=<prefix_path>
```

If you make changes to `CMakeLists.txt` you may need to clean out
existing CMake cached variable values by deleting all of the
files in the build directory.
