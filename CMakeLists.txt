cmake_minimum_required(VERSION 3.0)

add_library(easy_opencv INTERFACE)

include("opencv_build_options.cmake") # TODO(TD) check si les gens ont pas def leur propre fichier

# we want to put everything in World
set(BUILD_opencv_world ON CACHE BOOL "" FORCE)

add_subdirectory(opencv)

target_include_directories(easy_opencv SYSTEM INTERFACE "opencv/include")
target_include_directories(easy_opencv SYSTEM INTERFACE "build") # TODO(TD) check cmake variable qui donne tjr le bon dossier
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

if(WIN32)
    target_link_libraries(easy_opencv INTERFACE opencv_world)
elseif(UNIX)
    # find_package(Threads REQUIRED)
    # find_package(PkgConfig REQUIRED) # TODO(TD) bouger dans les testes
    # pkg_check_modules(GTK3 REQUIRED gtk+-3.0) # TODO(TD) bouger dans les testes
    # target_include_directories(easy_opencv SYSTEM INTERFACE ${GTK3_INCLUDE_DIRS}) # TODO(TD) bouger dans les testes

    # target_link_libraries(easy_opencv INTERFACE opencv_world ${GTK3_LIBRARIES} Threads::Threads dl) # TODO(TD) dl nécessaire ?
    target_link_libraries(easy_opencv INTERFACE opencv_world Threads::Threads dl) # TODO(TD) dl nécessaire ?

elseif(APPLE)
endif()
