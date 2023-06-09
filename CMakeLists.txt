cmake_minimum_required(VERSION 3.8)

set(WARNINGS_AS_ERRORS_FOR_EASY_OPENCV OFF CACHE BOOL "ON iff you want to treat warnings as errors")

add_library(easy_opencv)
add_library(easy_opencv::easy_opencv ALIAS easy_opencv)
target_compile_features(easy_opencv PUBLIC cxx_std_20)

# ---Add source files---
if(WARNINGS_AS_ERRORS_FOR_EASY_OPENCV)
    target_include_directories(easy_opencv PUBLIC include)
else()
    target_include_directories(easy_opencv SYSTEM PUBLIC include)
endif()
file(GLOB_RECURSE SRC_FILES CONFIGURE_DEPENDS src/*.cpp)
target_sources(easy_opencv PRIVATE ${SRC_FILES})

# ---Set warning level---
if(MSVC)
    target_compile_options(easy_opencv PRIVATE /W4)
else()
    target_compile_options(easy_opencv PRIVATE -Wall -Wextra -Wpedantic -pedantic-errors -Wconversion -Wsign-conversion)
endif()

# ---Maybe enable warnings as errors---
if(WARNINGS_AS_ERRORS_FOR_EASY_OPENCV)
    if(MSVC)
        target_compile_options(easy_opencv PRIVATE /WX)
    else()
        target_compile_options(easy_opencv PRIVATE -Werror)
    endif()
endif()
