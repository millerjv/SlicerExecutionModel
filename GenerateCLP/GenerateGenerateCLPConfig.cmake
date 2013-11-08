# Generate the GenerateCLPConfig.cmake file in the build tree and configure
# one the installation tree.

# Following the standard pattern, UseGenerateCLP.cmake is a configured file
#

get_target_property(GenerateCLP_EXE_PATH GenerateCLPLauncher LOCATION)
get_target_property(AttachCLPResource_EXE_PATH AttachCLPResource LOCATION)

if(GenerateCLP_EXE_PATH)
  set(GENERATECLP_EXE "${GenerateCLP_EXE_PATH}")
  set(ATTACHCLPRESOURCE_EXE "${AttachCLPResource_EXE_PATH}")
else()
  set(USE_CONFIG_FILE_INSTALL_DIR ${GenerateCLP_BINARY_DIR})
  set(GENERATECLP_EXE "${USE_CONFIG_FILE_INSTALL_DIR}/${CMAKE_CFG_INTDIR}/GenerateCLPLauncher")
  set(ATTACHCLPRESOURCE_EXE "${AttachCLPResource_EXE_PATH}")
endif()

# Settings specific to build trees
#
#
set(GenerateCLP_USE_FILE_CONFIG ${GenerateCLP_BINARY_DIR}/UseGenerateCLP.cmake)
configure_file(${GenerateCLP_SOURCE_DIR}/UseGenerateCLP.cmake.in
  ${GenerateCLP_USE_FILE_CONFIG}
  @ONLY)

set(GenerateCLP_INCLUDE_DIRS_CONFIG ${GenerateCLP_INCLUDE_DIRS})
set(GenerateCLP_LIBRARY_DIRS_CONFIG
  ${CMAKE_ARCHIVE_OUTPUT_DIRECTORY}
  ${CMAKE_LIBRARY_OUTPUT_DIRECTORY}
  )
set(GenerateCLP_CMAKE_DIR_CONFIG ${GenerateCLP_BINARY_DIR})
set(GENERATECLP_EXE_CONFIG "${GENERATECLP_EXE}")
set(ATTACHCLPRESOURCE_EXE_CONFIG "${ATTACHCLPRESOURCE_EXE}")
set(ITK_DIR_CONFIG ${ITK_DIR})
configure_file(${GenerateCLP_SOURCE_DIR}/GenerateCLPConfig.cmake.in
  ${GenerateCLP_BINARY_DIR}/GenerateCLPConfig.cmake @ONLY)


# TODO - Settings specific for installation trees
#
#
#configure_file(${GenerateCLP_SOURCE_DIR}/UseGenerateCLP.cmake.in
#  ${GenerateCLP_BINARY_DIR}/UseGenerateCLP.cmake_install
#  @ONLY)

#configure_file(${GenerateCLP_SOURCE_DIR}/GenerateCLPInstallConfig.cmake.in
#  ${GenerateCLP_BINARY_DIR}/GenerateCLPConfig.cmake_install @ONLY)
