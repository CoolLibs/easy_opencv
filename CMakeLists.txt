cmake_minimum_required(VERSION 3.5)

add_library(easy_opencv INTERFACE)
add_library(easy_opencv::easy_opencv ALIAS easy_opencv)

set(BUILD_opencv_world ON CACHE BOOL "" FORCE)
set(OPENCV_GENERATE_SETUPVARS OFF CACHE BOOL "" FORCE)
set(OPENCV_ENABLE_ALLOCATOR_STATS OFF CACHE BOOL "" FORCE)
add_subdirectory(opencv)

if(MSVC)
    target_compile_options(opencv_world PRIVATE
        $<$<CONFIG:Debug>:/MDd>
        $<$<NOT:$<CONFIG:Debug>>:/MD>
    )
endif()

target_include_directories(easy_opencv SYSTEM INTERFACE "opencv/include")
target_include_directories(easy_opencv SYSTEM INTERFACE "${CMAKE_BINARY_DIR}") # Not sure about this line. In some complex setups the OpenCV header might end up in a different place than this one.
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

target_link_libraries(easy_opencv INTERFACE opencv_world)