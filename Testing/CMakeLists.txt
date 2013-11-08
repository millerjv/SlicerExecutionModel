find_package(SlicerExecutionModel REQUIRED GenerateCLP)
include(${SlicerExecutionModel_USE_FILE})

SEMMacroBuildCLI(
  NAME TestZipResource
  CLI_RESOURCE_ZIP ${CMAKE_CURRENT_SOURCE_DIR}/TestZipResource.zip
  VERBOSE
)
