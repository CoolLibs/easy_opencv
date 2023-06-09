cmake_minimum_required(VERSION 3.0)



function(target_link_opencv TARGET VISIBILITY)
    
    include("${CMAKE_CURRENT_FUNCTION_LIST_DIR}/opencv_build_options.cmake")
    set(OPENCV_FOLDER "${CMAKE_CURRENT_FUNCTION_LIST_DIR}/opencv")
    add_subdirectory("${OPENCV_FOLDER}" build)


    #same include for all plateforms
    target_include_directories(${TARGET} SYSTEM ${VISIBILITY} "${OPENCV_FOLDER}/include")
    target_include_directories(${TARGET} SYSTEM ${VISIBILITY} "../build") #TODO(TD) check cmake variable qui donne tjr le bon dossier
    target_include_directories(${TARGET} SYSTEM ${VISIBILITY} "${OPENCV_FOLDER}/modules/calib3d/include")
    target_include_directories(${TARGET} SYSTEM ${VISIBILITY} "${OPENCV_FOLDER}/modules/core/include")
    target_include_directories(${TARGET} SYSTEM ${VISIBILITY} "${OPENCV_FOLDER}/modules/dnn/include")
    target_include_directories(${TARGET} SYSTEM ${VISIBILITY} "${OPENCV_FOLDER}/modules/feature2d/include")
    target_include_directories(${TARGET} SYSTEM ${VISIBILITY} "${OPENCV_FOLDER}/modules/flann/include")
    target_include_directories(${TARGET} SYSTEM ${VISIBILITY} "${OPENCV_FOLDER}/modules/gapi/include")
    target_include_directories(${TARGET} SYSTEM ${VISIBILITY} "${OPENCV_FOLDER}/modules/highgui/include")
    target_include_directories(${TARGET} SYSTEM ${VISIBILITY} "${OPENCV_FOLDER}/modules/imgcodecs/include")
    target_include_directories(${TARGET} SYSTEM ${VISIBILITY} "${OPENCV_FOLDER}/modules/imgproc/include")
    target_include_directories(${TARGET} SYSTEM ${VISIBILITY} "${OPENCV_FOLDER}/modules/java/include")
    target_include_directories(${TARGET} SYSTEM ${VISIBILITY} "${OPENCV_FOLDER}/modules/js/include")
    target_include_directories(${TARGET} SYSTEM ${VISIBILITY} "${OPENCV_FOLDER}/modules/ml/include")
    target_include_directories(${TARGET} SYSTEM ${VISIBILITY} "${OPENCV_FOLDER}/modules/objc/include")
    target_include_directories(${TARGET} SYSTEM ${VISIBILITY} "${OPENCV_FOLDER}/modules/objdetect/include")
    target_include_directories(${TARGET} SYSTEM ${VISIBILITY} "${OPENCV_FOLDER}/modules/photo/include")
    target_include_directories(${TARGET} SYSTEM ${VISIBILITY} "${OPENCV_FOLDER}/modules/python/include")
    target_include_directories(${TARGET} SYSTEM ${VISIBILITY} "${OPENCV_FOLDER}/modules/stitching/include")
    target_include_directories(${TARGET} SYSTEM ${VISIBILITY} "${OPENCV_FOLDER}/modules/ts/include")
    target_include_directories(${TARGET} SYSTEM ${VISIBILITY} "${OPENCV_FOLDER}/modules/video/include")
    target_include_directories(${TARGET} SYSTEM ${VISIBILITY} "${OPENCV_FOLDER}/modules/videoio/include")
    target_include_directories(${TARGET} SYSTEM ${VISIBILITY} "${OPENCV_FOLDER}/modules/world/include")
    


    #build opencv
    

    if(WIN32)
        target_link_libraries(${TARGET} PUBLIC opencv_world)

    elseif(UNIX) # for now, just the 4.5.5 version, only in Release

        find_package(Threads REQUIRED)
        
        find_package(PkgConfig REQUIRED)
        pkg_check_modules(GTK3 REQUIRED gtk+-3.0)
        target_include_directories(${TARGET} SYSTEM ${VISIBILITY} ${GTK3_INCLUDE_DIRS})

        target_link_libraries(${TARGET} PUBLIC opencv_world ${GTK3_LIBRARIES} Threads::Threads dl)
        
    elseif(APPLE)

    endif() 

endfunction()