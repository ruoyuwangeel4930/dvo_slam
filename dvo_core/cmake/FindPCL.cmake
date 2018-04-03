SET(PCL_INCLUDE_DIRS /usr/include/pcl-1.7)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(PCL DEFAULT_MSG
  PCL_INCLUDE_DIRS)
