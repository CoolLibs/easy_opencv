cmake_minimum_required(VERSION 3.20)

include("CMakeUtils/files_and_folders.cmake")

function(target_link_opencv TARGET VISIBILITY)
    set(RELEASE_OR_DEBUG "$<$<CONFIG:Debug>:d>")
    
    include("${CMAKE_CURRENT_FUNCTION_LIST_DIR}/opencv_build_options.cmake")
    add_subdirectory("${CMAKE_CURRENT_FUNCTION_LIST_DIR}/opencv/opencv_4_7_0" build)


    #same include for all plateforms
    set(OPENCV_FOLDER "${CMAKE_CURRENT_FUNCTION_LIST_DIR}/opencv/opencv_4_7_0")
    target_include_directories(${TARGET} SYSTEM ${VISIBILITY} "${CMAKE_CURRENT_FUNCTION_LIST_DIR}/include")

    #build opencv
    

    if(WIN32)
        target_link_libraries(${TARGET} PRIVATE opencv_world )

    elseif(UNIX) # for now, just the 4.5.5 version, only in Release

        find_package(Threads REQUIRED)
        
        find_package(PkgConfig REQUIRED)
        pkg_check_modules(GTK3 REQUIRED gtk+-3.0)
        include_directories(${GTK3_INCLUDE_DIRS})

        set(OPENCV_BUILD_FOLDER "${OPENCV_FOLDER}/Linux/static")
        set (3RD_PARTY "${CMAKE_CURRENT_FUNCTION_LIST_DIR}/build/3rdparty")
        message("\n\n\n\n 3rd party folder : ${3RD_PARTY} \n\n\n\n")
        target_link_directories(${TARGET} ${VISIBILITY} "${OPENCV_FOLDER}")

        target_link_libraries(${TARGET} PRIVATE opencv_world ${GTK3_LIBRARIES} Threads::Threads dl) # avcodec avformat avutil dl for ffmpeg ?
        
    elseif(APPLE)

    endif() 

endfunction()