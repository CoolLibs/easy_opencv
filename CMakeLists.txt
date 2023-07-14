cmake_minimum_required(VERSION 3.5)

add_library(easy_opencv INTERFACE)

set(BUILD_opencv_world ON CACHE BOOL "" FORCE)
set(OPENCV_PYTHON_SKIP_DETECTION ON CACHE BOOL "" FORCE)

add_subdirectory(opencv)

# same include for all plateforms
target_include_directories(easy_opencv SYSTEM INTERFACE "opencv/include")
target_include_directories(easy_opencv SYSTEM INTERFACE "${CMAKE_BINARY_DIR}") # if you cannot include OpenCV, it is possible that ${CMAKE_BINARY_DIR} was not the right folder to use please rase an issue on github.
target_include_directories(easy_opencv SYSTEM INTERFACE "opencv/modules/calib3d/include")
target_include_directories(easy_opencv SYSTEM INTERFACE "opencv/modules/core/include")
target_include_directories(easy_opencv SYSTEM INTERFACE "opencv/modules/dnn/include")
target_include_directories(easy_opencv SYSTEM INTERFACE "opencv/modules/feature2d/include")
target_include_directories(easy_opencv SYSTEM INTERFACE "opencv/modules/flann/include")
target_include_directories(easy_opencv SYSTEM INTERFACE "opencv/modules/gapi/include")
target_include_directories(easy_opencv SYSTEM INTERFACE "opencv/modules/highgui/include")
target_include_directories(easy_opencv SYSTEM INTERFACE "opencv/modules/imgcodecs/include")
target_include_directories(easy_opencv SYSTEM INTERFACE "opencv/modules/imgproc/include")
target_include_directories(easy_opencv SYSTEM INTERFACE "opencv/modules/java/include")
target_include_directories(easy_opencv SYSTEM INTERFACE "opencv/modules/js/include")
target_include_directories(easy_opencv SYSTEM INTERFACE "opencv/modules/ml/include")
target_include_directories(easy_opencv SYSTEM INTERFACE "opencv/modules/objc/include")
target_include_directories(easy_opencv SYSTEM INTERFACE "opencv/modules/objdetect/include")
target_include_directories(easy_opencv SYSTEM INTERFACE "opencv/modules/photo/include")
target_include_directories(easy_opencv SYSTEM INTERFACE "opencv/modules/python/include")
target_include_directories(easy_opencv SYSTEM INTERFACE "opencv/modules/stitching/include")
target_include_directories(easy_opencv SYSTEM INTERFACE "opencv/modules/ts/include")
target_include_directories(easy_opencv SYSTEM INTERFACE "opencv/modules/video/include")
target_include_directories(easy_opencv SYSTEM INTERFACE "opencv/modules/videoio/include")
target_include_directories(easy_opencv SYSTEM INTERFACE "opencv/modules/world/include")

# build opencv
if(WIN32)
    target_link_libraries(easy_opencv INTERFACE opencv_world)

elseif(UNIX) # for now, just the 4.5.5 version, only in Release
    find_package(Threads REQUIRED)
    target_link_libraries(easy_opencv INTERFACE opencv_world Threads::Threads dl)

elseif(APPLE)
endif()
