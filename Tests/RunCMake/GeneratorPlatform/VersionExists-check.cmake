if(actual_stdout MATCHES "CMAKE_VS_WINDOWS_TARGET_PLATFORM_VERSION='([^']+)'")
  set(actual_version "${CMAKE_MATCH_1}")
elseif(actual_stdout MATCHES "CMAKE_VS_WINDOWS_TARGET_PLATFORM_VERSION=''" AND RunCMake_GENERATOR MATCHES "Visual Studio 1[45] ")
  set(actual_version "8.1")
else()
  set(RunCMake_TEST_FAILED "No CMAKE_VS_WINDOWS_TARGET_PLATFORM_VERSION found in output.")
  return()
endif()

if(NOT "${actual_version}" STREQUAL "${expect_version}")
  set(RunCMake_TEST_FAILED "Actual SDK version '${actual_version}' did not match expected '${expect_version}'")
  return()
endif()
