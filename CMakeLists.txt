cmake_minimum_required(VERSION 3.20)

include("CMakeUtils/files_and_folders.cmake")

function(target_link_opencv TARGET VISIBILITY)
    set(RELEASE_OR_DEBUG "$<$<CONFIG:Debug>:d>")
    
    #same include for all plateforms
    set(OPENCV_FOLDER "${CMAKE_CURRENT_FUNCTION_LIST_DIR}/opencv")
    target_include_directories(${TARGET} SYSTEM ${VISIBILITY} "${OPENCV_FOLDER}/include")

    if(WIN32)

        set(OPENCV_BUILD_FOLDER "${OPENCV_FOLDER}/Windows/vc16")

        target_link_libraries(${TARGET} ${VISIBILITY} "${OPENCV_BUILD_FOLDER}/lib/opencv_world470${RELEASE_OR_DEBUG}.lib")
        
        # Copy all the .dll because they must be next to the executable.
        Cool__target_copy_file(${TARGET}
            "${OPENCV_BUILD_FOLDER}/bin/opencv_world470${RELEASE_OR_DEBUG}.dll"
            "opencv_world470${RELEASE_OR_DEBUG}.dll"
        )
        Cool__target_copy_file(${TARGET}
            "${OPENCV_BUILD_FOLDER}/bin/opencv_videoio_msmf470_64${RELEASE_OR_DEBUG}.dll"
            "opencv_videoio_msmf470_64${RELEASE_OR_DEBUG}.dll"
        )
        Cool__target_copy_file(${TARGET}
            "${OPENCV_BUILD_FOLDER}/bin/opencv_videoio_ffmpeg470_64.dll"
            "opencv_videoio_ffmpeg470_64.dll"
        )

    elseif(UNIX) # for now, just the 4.5.5 version, only in Release

        find_package(Threads REQUIRED)
        
        find_package(PkgConfig REQUIRED)
        pkg_check_modules(GTK3 REQUIRED gtk+-3.0)
        include_directories(${GTK3_INCLUDE_DIRS})
        # find_package(FFmpeg REQUIRED)      

        # find_package(libavutil REQUIRED)

        set(OPENCV_BUILD_FOLDER "${OPENCV_FOLDER}/Linux/static")
        set (3RD_PARTY "${CMAKE_CURRENT_FUNCTION_LIST_DIR}/build/3rdparty")
        message("\n\n\n\n 3rd party folder : ${3RD_PARTY} \n\n\n\n")
        target_link_directories(${TARGET} ${VISIBILITY} "${OPENCV_FOLDER}")

        target_link_libraries(${TARGET} "${OPENCV_BUILD_FOLDER}/libopencv_world.a" ${GTK3_LIBRARIES} Threads::Threads dl) # avcodec avformat avutil dl for ffmpeg ?
        
        Cool__target_copy_file(${TARGET}
            "${OPENCV_BUILD_FOLDER}/libopencv_world.a"
            "libopencv_world.a"
        )
        # Cool__target_copy_file(${TARGET}
        # "${3RD_PARTY}/ippicv/ippicv_lnx/icv/lib/intel64/libippicv.a"
        # "libippiw.a"
        # )
        # Cool__target_copy_file(${TARGET}
        # "{3RD_PARTY}/ippicv/ippicv_lnx/icv/lib/intel64/libippicv.a"
        # "libippicv.a"
        # )
        # Cool__target_copy_file(${TARGET}
        # "${OPENCV_BUILD_FOLDER}/libopencv_core.a"
        # "libopencv_core.a"
        # )
        # Cool__target_copy_file(${TARGET}
        # "${OPENCV_BUILD_FOLDER}/libopencv_highgui.a"
        # "libopencv_highgui.a"
        # )
        # Cool__target_copy_file(${TARGET}
        # "${OPENCV_BUILD_FOLDER}/libopencv_videoio.a"
        # "libopencv_videoio.a"
        # )
        # Cool__target_copy_file(${TARGET}
        # "${OPENCV_BUILD_FOLDER}/libopencv_imgcodecs.a"
        # "libopencv_imgcodecs.a"
        # )
        # Cool__target_copy_file(${TARGET}
        # "${OPENCV_BUILD_FOLDER}/libopencv_imgproc.a"
        # "libopencv_imgproc.a"
        # )



    elseif(APPLE)

    endif() 

endfunction()