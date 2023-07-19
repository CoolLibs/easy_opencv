cmake_minimum_required(VERSION 3.5)
project(easy_opencv-tests)

# ---Create executable---
add_executable(${PROJECT_NAME} tests.cpp)
target_compile_features(${PROJECT_NAME} PRIVATE cxx_std_11)

# ---Include our library---
include("opencv_build_options.cmake")
add_subdirectory(.. ${CMAKE_CURRENT_SOURCE_DIR}/build/easy_opencv)
target_link_libraries(${PROJECT_NAME} PRIVATE easy_opencv::easy_opencv)

if(LINUX) # Needed for the windowing part
    find_package(PkgConfig REQUIRED)
    pkg_check_modules(GTK3 REQUIRED gtk+-3.0)
    target_include_directories(${PROJECT_NAME} SYSTEM PRIVATE ${GTK3_INCLUDE_DIRS})
    target_link_libraries(${PROJECT_NAME} PRIVATE ${GTK3_LIBRARIES})
endif()

# ---Ignore .vscode/settings.json in Git---
find_package(Git QUIET)

if(GIT_FOUND)
    get_filename_component(PARENT_DIR ${CMAKE_CURRENT_SOURCE_DIR} DIRECTORY)

    if(EXISTS "${PARENT_DIR}/.git")
        execute_process(COMMAND ${GIT_EXECUTABLE} update-index --assume-unchanged .vscode/settings.json
            WORKING_DIRECTORY ${PARENT_DIR}
            RESULT_VARIABLE ERRORS)

        if(NOT ERRORS EQUAL "0")
            message("Git assume-unchanged failed: ${ERRORS}")
        endif()
    else()
        message("No Git repository found.")
    endif()
else()
    message("Git executable not found.")
endif()
