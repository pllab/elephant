#!/bin/bash

set -e

BUILD_DIR="emap/cpp/build"
mkdir -p "$BUILD_DIR"
cd "$BUILD_DIR"
cmake ..
make
