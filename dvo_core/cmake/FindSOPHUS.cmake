FIND_PATH(SOPHUS_INCLUDE_DIRS NAMES se3.hpp
  PATHS
  /usr/include
  /usr/include/sophus
  /usr/local/include
  /usr/local/include/sophus
  $ENV{SOPHUS_ROOT}
  $ENV{SOPHUS_ROOT}/inlcude
  $ENV{SOPHUS_ROOT}/inlcude/sophus	
  )

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(SOPHUS DEFAULT_MSG
  SOPHUS_INCLUDE_DIRS)
