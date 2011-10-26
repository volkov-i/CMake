# - Find TIFF library
# Find the native TIFF includes and library
# This module defines
#  TIFF_INCLUDE_DIR, where to find tiff.h, etc.
#  TIFF_LIBRARIES, libraries to link against to use TIFF.
#  TIFF_FOUND, If false, do not try to use TIFF.
# also defined, but not for general use are
#  TIFF_LIBRARY, where to find the TIFF library.

#=============================================================================
# Copyright 2002-2009 Kitware, Inc.
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

find_path(TIFF_INCLUDE_DIR tiff.h)

set(TIFF_NAMES ${TIFF_NAMES} tiff libtiff tiff3 libtiff3)
find_library(TIFF_LIBRARY NAMES ${TIFF_NAMES} )

# handle the QUIETLY and REQUIRED arguments and set TIFF_FOUND to TRUE if
# all listed variables are TRUE
include(${CMAKE_CURRENT_LIST_DIR}/FindPackageHandleStandardArgs.cmake)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(TIFF  DEFAULT_MSG  TIFF_LIBRARY  TIFF_INCLUDE_DIR)

if(TIFF_FOUND)
  set( TIFF_LIBRARIES ${TIFF_LIBRARY} )
endif(TIFF_FOUND)

mark_as_advanced(TIFF_INCLUDE_DIR TIFF_LIBRARY)
