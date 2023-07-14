cmake_minimum_required(VERSION 3.20)
project(easy_opencv-tests)

# ---Create executable---
add_executable(${PROJECT_NAME} tests.cpp)
target_compile_features(${PROJECT_NAME} PRIVATE cxx_std_11)

# ---Include our library---
add_subdirectory(.. ${CMAKE_CURRENT_SOURCE_DIR}/build/easy_opencv)

# we need gtk for the window (only linux)
if(UNIX)
    set(WITH_GTK ON CACHE BOOL "" FORCE)
    find_package(Threads REQUIRED)
    find_package(PkgConfig REQUIRED) # TODO(TD) bouger dans les testes
    pkg_check_modules(GTK3 REQUIRED gtk+-3.0) # TODO(TD) bouger dans les testes
    target_include_directories(easy_opencv-tests SYSTEM INTERFACE ${GTK3_INCLUDE_DIRS}) # TODO(TD) bouger dans les testes

    target_link_libraries(easy_opencv-tests INTERFACE ${GTK3_LIBRARIES})

else()
    target_link_libraries(${PROJECT_NAME} PRIVATE easy_opencv) # TODO(TD) check for mac after
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
