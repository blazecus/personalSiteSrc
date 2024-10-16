# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

# If CMAKE_DISABLE_SOURCE_CHANGES is set to true and the source directory is an
# existing directory in our source tree, calling file(MAKE_DIRECTORY) on it
# would cause a fatal error, even though it would be a no-op.
if(NOT EXISTS "C:/Users/Jack Blazes/Documents/engine/build-web/_deps/webgpu-backend-emscripten-src")
  file(MAKE_DIRECTORY "C:/Users/Jack Blazes/Documents/engine/build-web/_deps/webgpu-backend-emscripten-src")
endif()
file(MAKE_DIRECTORY
  "C:/Users/Jack Blazes/Documents/engine/build-web/_deps/webgpu-backend-emscripten-build"
  "C:/Users/Jack Blazes/Documents/engine/build-web/_deps/webgpu-backend-emscripten-subbuild/webgpu-backend-emscripten-populate-prefix"
  "C:/Users/Jack Blazes/Documents/engine/build-web/_deps/webgpu-backend-emscripten-subbuild/webgpu-backend-emscripten-populate-prefix/tmp"
  "C:/Users/Jack Blazes/Documents/engine/build-web/_deps/webgpu-backend-emscripten-subbuild/webgpu-backend-emscripten-populate-prefix/src/webgpu-backend-emscripten-populate-stamp"
  "C:/Users/Jack Blazes/Documents/engine/build-web/_deps/webgpu-backend-emscripten-subbuild/webgpu-backend-emscripten-populate-prefix/src"
  "C:/Users/Jack Blazes/Documents/engine/build-web/_deps/webgpu-backend-emscripten-subbuild/webgpu-backend-emscripten-populate-prefix/src/webgpu-backend-emscripten-populate-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "C:/Users/Jack Blazes/Documents/engine/build-web/_deps/webgpu-backend-emscripten-subbuild/webgpu-backend-emscripten-populate-prefix/src/webgpu-backend-emscripten-populate-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "C:/Users/Jack Blazes/Documents/engine/build-web/_deps/webgpu-backend-emscripten-subbuild/webgpu-backend-emscripten-populate-prefix/src/webgpu-backend-emscripten-populate-stamp${cfgdir}") # cfgdir has leading slash
endif()
