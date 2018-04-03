cmake_minimum_required(VERSION 2.4.6)
include($ENV{ROS_ROOT}/core/rosbuild/rosbuild.cmake)
set(CMAKE_CXX_STANDARD 11)

# Set the build type.  Options are:
#  Coverage       : w/ debug symbols, w/o optimization, w/ code-coverage
#  Debug          : w/ debug symbols, w/o optimization
#  Release        : w/o debug symbols, w/ optimization
#  RelWithDebInfo : w/ debug symbols, w/ optimization
#  MinSizeRel     : w/o debug symbols, w/ optimization, stripped binaries
#set(ROS_BUILD_TYPE RelWithDebInfo)

rosbuild_init()

#set the default path for built executables to the "bin" directory
set(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/bin)
#set the default path for built libraries to the "lib" directory
set(LIBRARY_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/lib)

#set the cmake module path
set(CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake)

#common commands for building c++ executables and libraries
#rosbuild_add_library(${PROJECT_NAME} src/example.cpp)
#target_link_libraries(${PROJECT_NAME} another_library)
#rosbuild_add_boost_directories()
#rosbuild_link_boost(${PROJECT_NAME} thread)
#rosbuild_add_executable(example examples/example.cpp)
#target_link_libraries(example ${PROJECT_NAME})

# Eigen3 library
find_package(Eigen3 REQUIRED)
include_directories(${EIGEN3_INCLUDE_DIRS})

# VTK library
find_package(VTK REQUIRED)
include_directories(${VTK_INCLUDE_DIRS})

# PCL library
FIND_PACKAGE(PCL)
INCLUDE_DIRECTORIES(${PCL_INCLUDE_DIRS})

# SSE flags
rosbuild_check_for_sse()

set(CMAKE_CXX_FLAGS_RELWITHDEBINFO
   "${SSE_FLAGS} -O3 -march=native"
)

rosbuild_add_library(${PROJECT_NAME} 
    src/core/interpolation.cpp
    src/core/intrinsic_matrix.cpp
    src/core/least_squares.cpp
    src/core/math_sse.cpp
    src/core/rgbd_image.cpp
    src/core/rgbd_image_sse.cpp
    src/core/point_selection.cpp
    src/core/surface_pyramid.cpp
    src/core/weight_calculation.cpp
    
    src/util/histogram.cpp
    
    src/visualization/camera_trajectory_visualizer.cpp
    
    src/dense_tracking.cpp
    src/dense_tracking_impl.cpp
    src/dense_tracking_config.cpp
)

target_link_libraries(${PROJECT_NAME} 
    tbb
    boost_thread
)

rosbuild_add_library(dvo_visualization
    src/visualization/async_point_cloud_builder.cpp
    src/visualization/point_cloud_aggregator.cpp
    src/visualization/pcl_camera_trajetory_visualizer.cpp
)

target_link_libraries(dvo_visualization
  ${PROJECT_NAME} 
)

#rosbuild_add_executable(sse_test
#    src/sse_test.cpp
#    src/core/math_sse.cpp
#)
