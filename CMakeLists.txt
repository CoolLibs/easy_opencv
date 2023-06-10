cmake_minimum_required(VERSION 3.20)

include("CMakeUtils/files_and_folders.cmake")

function(target_link_opencv TARGET VISIBILITY)
    set(RELEASE_OR_DEBUG "$<$<CONFIG:Debug>:d>")

    if(WIN32)

        set(OPENCV_FOLDER "${CMAKE_CURRENT_FUNCTION_LIST_DIR}/opencv")
        set(OPENCV_BUILD_FOLDER "${OPENCV_FOLDER}/vc16")

        target_link_libraries(${TARGET} ${VISIBILITY} "${OPENCV_BUILD_FOLDER}/lib/opencv_world470${RELEASE_OR_DEBUG}.lib")
        target_include_directories(${TARGET} SYSTEM ${VISIBILITY} "${OPENCV_FOLDER}/include")
        
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

    elseif(UNIX)

    elseif(APPLE)

    endif() 

endfunction()