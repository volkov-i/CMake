
#=============================================================================
# Copyright 2004-2009 Kitware, Inc.
#
# Distributed under the OSI-approved BSD License (the "License");
# see accompanying file Copyright.txt for details.
#
# This software is distributed WITHOUT ANY WARRANTY; without even the
# implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
# See the License for more information.
#=============================================================================
# (To distribute this file outside of CMake, substitute the full
#  License text for the above reference.)

# this file has flags that are shared across languages and sets
# cache values that can be initialized in the platform-compiler.cmake file
# it may be included by more than one language.

set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS_INIT} $ENV{LDFLAGS}"
     CACHE STRING "Flags used by the linker.")


if(NOT CMAKE_NOT_USING_CONFIG_FLAGS)
# default build type is none
  if(NOT CMAKE_NO_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE ${CMAKE_BUILD_TYPE_INIT} CACHE STRING
      "Choose the type of build, options are: None(CMAKE_CXX_FLAGS or CMAKE_C_FLAGS used) Debug Release RelWithDebInfo MinSizeRel.")
  endif(NOT CMAKE_NO_BUILD_TYPE)

  set(CMAKE_EXE_LINKER_FLAGS_DEBUG ${CMAKE_EXE_LINKER_FLAGS_DEBUG_INIT} CACHE STRING
     "Flags used by the linker during debug builds.")

  set(CMAKE_EXE_LINKER_FLAGS_MINSIZEREL ${CMAKE_EXE_LINKER_FLAGS_MINSIZEREL_INIT} CACHE STRING
     "Flags used by the linker during release minsize builds.")

  set(CMAKE_EXE_LINKER_FLAGS_RELEASE ${CMAKE_EXE_LINKER_FLAGS_RELEASE_INIT} CACHE STRING
     "Flags used by the linker during release builds.")

  set(CMAKE_EXE_LINKER_FLAGS_RELWITHDEBINFO
     ${CMAKE_EXE_LINKER_FLAGS_RELWITHDEBINFO_INIT} CACHE STRING
     "Flags used by the linker during Release with Debug Info builds.")

  set(CMAKE_SHARED_LINKER_FLAGS_DEBUG ${CMAKE_SHARED_LINKER_FLAGS_DEBUG_INIT} CACHE STRING
     "Flags used by the linker during debug builds.")

  set(CMAKE_SHARED_LINKER_FLAGS_MINSIZEREL ${CMAKE_SHARED_LINKER_FLAGS_MINSIZEREL_INIT}
     CACHE STRING
     "Flags used by the linker during release minsize builds.")

  set(CMAKE_SHARED_LINKER_FLAGS_RELEASE ${CMAKE_SHARED_LINKER_FLAGS_RELEASE_INIT} CACHE STRING
     "Flags used by the linker during release builds.")

  set(CMAKE_SHARED_LINKER_FLAGS_RELWITHDEBINFO
     ${CMAKE_SHARED_LINKER_FLAGS_RELWITHDEBINFO_INIT} CACHE STRING
     "Flags used by the linker during Release with Debug Info builds.")

  set(CMAKE_MODULE_LINKER_FLAGS_DEBUG ${CMAKE_MODULE_LINKER_FLAGS_DEBUG_INIT} CACHE STRING
     "Flags used by the linker during debug builds.")

  set(CMAKE_MODULE_LINKER_FLAGS_MINSIZEREL ${CMAKE_MODULE_LINKER_FLAGS_MINSIZEREL_INIT}
     CACHE STRING
     "Flags used by the linker during release minsize builds.")

  set(CMAKE_MODULE_LINKER_FLAGS_RELEASE ${CMAKE_MODULE_LINKER_FLAGS_RELEASE_INIT} CACHE STRING
     "Flags used by the linker during release builds.")

  set(CMAKE_MODULE_LINKER_FLAGS_RELWITHDEBINFO
     ${CMAKE_MODULE_LINKER_FLAGS_RELWITHDEBINFO_INIT} CACHE STRING
     "Flags used by the linker during Release with Debug Info builds.")

endif(NOT CMAKE_NOT_USING_CONFIG_FLAGS)
# shared linker flags
set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS_INIT} $ENV{LDFLAGS}"
     CACHE STRING "Flags used by the linker during the creation of dll's.")

# module linker flags
set(CMAKE_MODULE_LINKER_FLAGS "${CMAKE_MODULE_LINKER_FLAGS_INIT} $ENV{LDFLAGS}"
     CACHE STRING "Flags used by the linker during the creation of modules.")

set(CMAKE_BUILD_TOOL ${CMAKE_MAKE_PROGRAM} CACHE INTERNAL
     "What is the target build tool cmake is generating for.")


mark_as_advanced(
CMAKE_BUILD_TOOL
CMAKE_VERBOSE_MAKEFILE

CMAKE_EXE_LINKER_FLAGS
CMAKE_EXE_LINKER_FLAGS_DEBUG
CMAKE_EXE_LINKER_FLAGS_MINSIZEREL
CMAKE_EXE_LINKER_FLAGS_RELEASE
CMAKE_EXE_LINKER_FLAGS_RELWITHDEBINFO

CMAKE_SHARED_LINKER_FLAGS
CMAKE_SHARED_LINKER_FLAGS_DEBUG
CMAKE_SHARED_LINKER_FLAGS_MINSIZEREL
CMAKE_SHARED_LINKER_FLAGS_RELEASE
CMAKE_SHARED_LINKER_FLAGS_RELWITHDEBINFO

CMAKE_MODULE_LINKER_FLAGS
CMAKE_MODULE_LINKER_FLAGS_DEBUG
CMAKE_MODULE_LINKER_FLAGS_MINSIZEREL
CMAKE_MODULE_LINKER_FLAGS_RELEASE
CMAKE_MODULE_LINKER_FLAGS_RELWITHDEBINFO

)

