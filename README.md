# easy_opencv

This library provides an easy way to build [OpenCV](https://opencv.org/) from source and statically link it into your project. You can also choose which of the parts of OpenCV you want to include / exclude from your build.

- [Including](#including)
- [Choosing which parts of OpenCV you want to build](#choosing-which-parts-of-opencv-you-want-to-build)
- [For maintainers](#for-maintainers)
  - [Running the tests](#running-the-tests)
  - [Building the tests for Linux](#building-the-tests-for-linux)


## Including

To add this library to your project, simply add these lines to your *CMakeLists.txt*:
```cmake
# Download the library
include(FetchContent)
FetchContent_Declare(
    easy_opencv
    GIT_REPOSITORY https://github.com/CoolLibs/easy_opencv
    GIT_TAG 0b7cf0f638c96595436c41d86ea531e29cdfc418
)
FetchContent_MakeAvailable(easy_opencv)

# Link the library into your project
target_link_libraries(${PROJECT_NAME} PRIVATE easy_opencv::easy_opencv)
```

You will then have access to OpenCV and be able to use this test program for example:
```cpp
#include <iostream>
#include <opencv2/opencv.hpp>

auto main() -> int
{
    cv::VideoCapture cap{0};
    if (!cap.isOpened())
    {
        std::cout << "Cannot access webcam.\n";
        return -1;
    }

    cv::Mat image;
    while (cv::waitKey(25) != 27) // 27 => ESCAPE
    {
        cap >> image;
        cv::imshow("Hello OpenCV", image);
    }
}
```

## Choosing which parts of OpenCV you want to build

To select which parts of OpenCV you want to build, we recommend creating an *opencv_build_options.cmake* file and including it in your CMakeLists.txt before including *easy_opencv*:
```cmake
# Choose which parts of OpenCV to build
include("opencv_build_options.cmake")

# Download the library
include(FetchContent)
FetchContent_Declare(
    easy_opencv
    GIT_REPOSITORY https://github.com/CoolLibs/easy_opencv
    GIT_TAG 0b7cf0f638c96595436c41d86ea531e29cdfc418
)
FetchContent_MakeAvailable(easy_opencv)

# Link the library into your project
target_link_libraries(${PROJECT_NAME} PRIVATE easy_opencv::easy_opencv)
```

This *opencv_build_options.cmake* file would look something like this, and you can turn  the different OpenCV options `ON` or `OFF`:

```cmake
#opencv_build_options.cmake

# Choose which external libraries to link into OpenCV
set(WITH_1394 OFF CACHE BOOL "" FORCE)
set(WITH_ADE OFF CACHE BOOL "" FORCE)
set(WITH_ARITH_DEC OFF CACHE BOOL "" FORCE)
set(WITH_AVIF OFF CACHE BOOL "" FORCE)
set(WITH_CANN OFF CACHE BOOL "" FORCE)
set(WITH_CLP OFF CACHE BOOL "" FORCE)
set(WITH_CUDA OFF CACHE BOOL "" FORCE)
set(WITH_DIRECTX OFF CACHE BOOL "" FORCE)

if(WIN32)
    set(WITH_DSHOW ON CACHE BOOL "" FORCE)
else()
    set(WITH_DSHOW OFF CACHE BOOL "" FORCE)
endif()

set(WITH_EIGEN OFF CACHE BOOL "" FORCE)
set(WITH_FFMPEG OFF CACHE BOOL "" FORCE)
set(WITH_FLATBUFFERS OFF CACHE BOOL "" FORCE)
set(WITH_FREETYPE OFF CACHE BOOL "" FORCE)
set(WITH_GDAL OFF CACHE BOOL "" FORCE)
set(WITH_GDCM OFF CACHE BOOL "" FORCE)
set(WITH_GSTREAMER OFF CACHE BOOL "" FORCE)

if(LINUX)
    set(WITH_GTK ON CACHE BOOL "" FORCE)
else()
    set(WITH_GTK OFF CACHE BOOL "" FORCE)
endif()

set(WITH_GTK_2_X OFF CACHE BOOL "" FORCE)
set(WITH_HALIDE OFF CACHE BOOL "" FORCE)
set(WITH_HPX OFF CACHE BOOL "" FORCE)
set(WITH_IMGCODEC_HDR OFF CACHE BOOL "" FORCE)
set(WITH_IMGCODEC_PFM OFF CACHE BOOL "" FORCE)
set(WITH_IMGCODEC_PXM OFF CACHE BOOL "" FORCE)
set(WITH_IMGCODEC_SUNRASTER OFF CACHE BOOL "" FORCE)
set(WITH_IPP OFF CACHE BOOL "" FORCE)
set(WITH_ITT OFF CACHE BOOL "" FORCE)
set(WITH_JASPER OFF CACHE BOOL "" FORCE)
set(WITH_JPEG OFF CACHE BOOL "" FORCE)
set(WITH_LAPACK OFF CACHE BOOL "" FORCE)
set(WITH_LIBREALSENSE OFF CACHE BOOL "" FORCE)
set(WITH_MFX OFF CACHE BOOL "" FORCE)
set(WITH_MSMF OFF CACHE BOOL "" FORCE)
set(WITH_MSMF_DXVA OFF CACHE BOOL "" FORCE)
set(WITH_OAK OFF CACHE BOOL "" FORCE)
set(WITH_OBSENSOR OFF CACHE BOOL "" FORCE)
set(WITH_OPENCL OFF CACHE BOOL "" FORCE)
set(WITH_OPENCLAMDBLAS OFF CACHE BOOL "" FORCE)
set(WITH_OPENCLAMDFFT OFF CACHE BOOL "" FORCE)
set(WITH_OPENCL_D3D11_NV OFF CACHE BOOL "" FORCE)
set(WITH_OPENCL_SVM OFF CACHE BOOL "" FORCE)
set(WITH_OPENEXR OFF CACHE BOOL "" FORCE)
set(WITH_OPENGL OFF CACHE BOOL "" FORCE)
set(WITH_OPENJPEG OFF CACHE BOOL "" FORCE)
set(WITH_OPENMP OFF CACHE BOOL "" FORCE)
set(WITH_OPENNI OFF CACHE BOOL "" FORCE)
set(WITH_OPENNI2 OFF CACHE BOOL "" FORCE)
set(WITH_OPENVINO OFF CACHE BOOL "" FORCE)
set(WITH_OPENVX OFF CACHE BOOL "" FORCE)
set(WITH_PLAIDML OFF CACHE BOOL "" FORCE)
set(WITH_PNG OFF CACHE BOOL "" FORCE)
set(WITH_PROTOBUF OFF CACHE BOOL "" FORCE)
set(WITH_PTHREADS_PF OFF CACHE BOOL "" FORCE)
set(WITH_PVAPI OFF CACHE BOOL "" FORCE)
set(WITH_QT OFF CACHE BOOL "" FORCE)
set(WITH_QUIRC OFF CACHE BOOL "" FORCE)
set(WITH_SPNG OFF CACHE BOOL "" FORCE)
set(WITH_TBB OFF CACHE BOOL "" FORCE)
set(WITH_TIFF OFF CACHE BOOL "" FORCE)
set(WITH_TIMVX OFF CACHE BOOL "" FORCE)
set(WITH_UEYE OFF CACHE BOOL "" FORCE)
set(WITH_VTK OFF CACHE BOOL "" FORCE)
set(WITH_VULKAN OFF CACHE BOOL "" FORCE)
set(WITH_WEBNN OFF CACHE BOOL "" FORCE)
set(WITH_WEBP OFF CACHE BOOL "" FORCE)

if(WIN32)
    set(WITH_WIN32UI ON CACHE BOOL "" FORCE)
else()
    set(WITH_WIN32UI OFF CACHE BOOL "" FORCE)
endif()

set(WITH_XIMEA OFF CACHE BOOL "" FORCE)

# Choose which parts of OpenCV to build
set(BUILD_JAVA OFF CACHE BOOL "" FORCE)
set(BUILD_opencv_apps OFF CACHE BOOL "" FORCE)
set(BUILD_opencv_calib3d OFF CACHE BOOL "" FORCE)
set(BUILD_opencv_dnn OFF CACHE BOOL "" FORCE)
set(BUILD_opencv_features2d OFF CACHE BOOL "" FORCE)
set(BUILD_opencv_flann OFF CACHE BOOL "" FORCE)
set(BUILD_opencv_gapi OFF CACHE BOOL "" FORCE)
set(BUILD_opencv_highgui ON CACHE BOOL "" FORCE)
set(BUILD_opencv_imgcodecs ON CACHE BOOL "" FORCE)
set(BUILD_opencv_imgproc ON CACHE BOOL "" FORCE)
set(BUILD_opencv_java_bindings_generator OFF CACHE BOOL "" FORCE)
set(BUILD_opencv_js OFF CACHE BOOL "" FORCE)
set(BUILD_opencv_js_bindings_generator OFF CACHE BOOL "" FORCE)
set(BUILD_opencv_ml OFF CACHE BOOL "" FORCE)
set(BUILD_opencv_objc_bindings_generator OFF CACHE BOOL "" FORCE)
set(BUILD_opencv_objdetect OFF CACHE BOOL "" FORCE)
set(BUILD_opencv_photo OFF CACHE BOOL "" FORCE)
set(BUILD_opencv_python_bindings_generator OFF CACHE BOOL "" FORCE)
set(BUILD_opencv_python_tests OFF CACHE BOOL "" FORCE)
set(BUILD_opencv_stitching OFF CACHE BOOL "" FORCE)
set(BUILD_opencv_ts OFF CACHE BOOL "" FORCE)
set(BUILD_opencv_video OFF CACHE BOOL "" FORCE)
set(BUILD_opencv_videoio ON CACHE BOOL "" FORCE)

# Choose if we want to skip Python support
set(OPENCV_PYTHON_SKIP_DETECTION ON CACHE BOOL "" FORCE)
```

You can find an example of such a setup in our *tests* folder.

## For maintainers

### Running the tests

Simply use "tests/CMakeLists.txt" to generate a project, then run it.<br/>
If you are using VSCode and the CMake extension, this project already contains a *.vscode/settings.json* that will use the right CMakeLists.txt automatically.

### Building the tests for Linux

You might need to install GTK (`sudo apt-get install libgtk-3-dev`).
