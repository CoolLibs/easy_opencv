
include("${CMAKE_SOURCE_DIR}/Cool/CMakeUtils/files_and_folders.cmake")

function(link_opencv TARGET VISIBILITY)
    set(RELEASE_OR_DEBUG "$<$<CONFIG:Debug>:d>$<$<CONFIG:Release>:>")

    if(WIN32)

        set(WINDOW_LIB_FILE "${CMAKE_CURRENT_FUNCTION_LIST_DIR}/opencv/vc16/lib/opencv_world470${RELEASE_OR_DEBUG}.lib")
        set(INCLUDE_PATH_OPENCV "${CMAKE_CURRENT_FUNCTION_LIST_DIR}/opencv/include")

        set(WINDOW_BIN_WORLD "${CMAKE_CURRENT_FUNCTION_LIST_DIR}/opencv/vc16/bin/opencv_world470${RELEASE_OR_DEBUG}.dll")
        set(WINDOW_BIN_VIDEO_MSMF "${CMAKE_CURRENT_FUNCTION_LIST_DIR}/opencv/vc16/bin/opencv_videoio_msmf470_64${RELEASE_OR_DEBUG}.dll")
        set(WINDOW_BIN_VIDEO_FFMPEG "${CMAKE_CURRENT_FUNCTION_LIST_DIR}/opencv/vc16/bin/opencv_videoio_ffmpeg470_64.dll")

        target_link_libraries(${TARGET} ${VISIBILITY} ${WINDOW_LIB_FILE})
        target_include_directories(${TARGET} ${VISIBILITY} ${INCLUDE_PATH_OPENCV})
        
        Cool__target_copy_file(${TARGET} ${WINDOW_BIN_WORLD} "opencv_world470${RELEASE_OR_DEBUG}.dll")
        Cool__target_copy_file(${TARGET} ${WINDOW_BIN_VIDEO_MSMF} "opencv_videoio_msmf470_64${RELEASE_OR_DEBUG}.dll")
        Cool__target_copy_file(${TARGET} ${WINDOW_BIN_VIDEO_FFMPEG} "opencv_videoio_ffmpeg470_64.dll")

    elseif(UNIX)

    elseif(APPLE)

    endif() 

endfunction()