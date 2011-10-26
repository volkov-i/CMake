# Find KDE4 and provide all necessary variables and macros to compile software for it.
# It looks for KDE 4 in the following directories in the given order:
#  CMAKE_INSTALL_PREFIX
#  KDEDIRS
#  /opt/kde4
#
# Please look in FindKDE4Internal.cmake and KDE4Macros.cmake for more information.
# They are installed with the KDE 4 libraries in $KDEDIRS/share/apps/cmake/modules/.
#
# Author: Alexander Neundorf <neundorf@kde.org>

#=============================================================================
# Copyright 2006-2009 Kitware, Inc.
# Copyright 2006 Alexander Neundorf <neundorf@kde.org>
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

# If Qt3 has already been found, fail.
if(QT_QT_LIBRARY)
  if(KDE4_FIND_REQUIRED)
    message( FATAL_ERROR "KDE4/Qt4 and Qt3 cannot be used together in one project.")
  else(KDE4_FIND_REQUIRED)
    if(NOT KDE4_FIND_QUIETLY)
      message( STATUS    "KDE4/Qt4 and Qt3 cannot be used together in one project.")
    endif(NOT KDE4_FIND_QUIETLY)
    return()
  endif(KDE4_FIND_REQUIRED)
endif(QT_QT_LIBRARY)

file(TO_CMAKE_PATH "$ENV{KDEDIRS}" _KDEDIRS)

# when cross compiling, searching kde4-config in order to run it later on
# doesn't make a lot of sense. We'll have to do something about this.
# Searching always in the target environment ? Then we get at least the correct one,
# still it can't be used to run it. Alex

# For KDE4 kde-config has been renamed to kde4-config
find_program(KDE4_KDECONFIG_EXECUTABLE NAMES kde4-config
   # the suffix must be used since KDEDIRS can be a list of directories which don't have bin/ appended
   PATH_SUFFIXES bin
   HINTS
   ${CMAKE_INSTALL_PREFIX}
   ${_KDEDIRS}
   /opt/kde4
   ONLY_CMAKE_FIND_ROOT_PATH
   )

if(NOT KDE4_KDECONFIG_EXECUTABLE)
   if(KDE4_FIND_REQUIRED)
      message(FATAL_ERROR "ERROR: Could not find KDE4 kde4-config")
   endif(KDE4_FIND_REQUIRED)
endif(NOT KDE4_KDECONFIG_EXECUTABLE)


# when cross compiling, KDE4_DATA_DIR may be already preset
if(NOT KDE4_DATA_DIR)
   if(CMAKE_CROSSCOMPILING)
      # when cross compiling, don't run kde4-config but use its location as install dir
      get_filename_component(KDE4_DATA_DIR "${KDE4_KDECONFIG_EXECUTABLE}" PATH)
      get_filename_component(KDE4_DATA_DIR "${KDE4_DATA_DIR}" PATH)
   else(CMAKE_CROSSCOMPILING)
      # then ask kde4-config for the kde data dirs

      if(KDE4_KDECONFIG_EXECUTABLE)
        execute_process(COMMAND "${KDE4_KDECONFIG_EXECUTABLE}" --path data OUTPUT_VARIABLE _data_DIR ERROR_QUIET OUTPUT_STRIP_TRAILING_WHITESPACE)
        file(TO_CMAKE_PATH "${_data_DIR}" _data_DIR)
        # then check the data dirs for FindKDE4Internal.cmake
        find_path(KDE4_DATA_DIR cmake/modules/FindKDE4Internal.cmake HINTS ${_data_DIR})
      endif(KDE4_KDECONFIG_EXECUTABLE)
   endif(CMAKE_CROSSCOMPILING)
endif(NOT KDE4_DATA_DIR)

# if it has been found...
if(KDE4_DATA_DIR)

   set(CMAKE_MODULE_PATH  ${CMAKE_MODULE_PATH} ${KDE4_DATA_DIR}/cmake/modules)

   if(KDE4_FIND_QUIETLY)
      set(_quiet QUIET)
   endif(KDE4_FIND_QUIETLY)

   if(KDE4_FIND_REQUIRED)
      set(_req REQUIRED)
   endif(KDE4_FIND_REQUIRED)

   # use FindKDE4Internal.cmake to do the rest
   find_package(KDE4Internal ${_req} ${_quiet})
else(KDE4_DATA_DIR)
   if(KDE4_FIND_REQUIRED)
      message(FATAL_ERROR "ERROR: cmake/modules/FindKDE4Internal.cmake not found in ${_data_DIR}")
   endif(KDE4_FIND_REQUIRED)
endif(KDE4_DATA_DIR)
