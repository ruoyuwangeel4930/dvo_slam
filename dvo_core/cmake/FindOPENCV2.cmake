FIND_PATH(OPENCV2_INCLUDE_DIRS NAMES opencv2/opencv.hpp
  PATHS
  /usr/include
  /usr/local/include
  NO_DEFAULT_PATH
  )

FIND_LIBRARY(OPENCV2_LIBS NAMES opencv_core
  PATHS
  /usr/lib
  /usr/local/lib
  NO_DEFAULT_PATH
  )

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(OPENCV2 DEFAULT_MSG
  OPENCV2_INCLUDE_DIRS OPENCV2_LIBS)
