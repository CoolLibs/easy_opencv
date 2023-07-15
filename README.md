# easy_opencv

## Including

To add this library to your project, simply add these lines to your *CMakeLists.txt*:
```cmake
# Download the library
include(FetchContent)
FetchContent_Declare(
    easy_opencv
    GIT_REPOSITORY https://github.com/CoolLibs/easy_opencv
    GIT_TAG d974ddf319dae5f96ab570bafcd4c923cc4dd3cf
)
FetchContent_MakeAvailable(easy_opencv)

# Link the library into your project
target_link_opencv(${PROJECT_NAME} visibility)
```
`visibility` can be either PUBLIC, PRIVATE or INTERFACE according to your needs.

You will then have access to OpenCV and be able to use this test program for example:
```cpp
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
    while (true)
    {
        cap >> image;
        cv::imshow("Hello OpenCV", image);
        cv::waitKey(25);
    }
}
```

## Choose options you want to use
In the `test` folder you have a file `opencv_build_options.cmake`, this files enables you to specify which modules or 3rdparty libraries will be used in OpenCV.

For your project, you need to copy it, set all the options you need and place it anywhere you want in your project.

In your `CMakeLists.txt` before you arr easy_opencv whith `add_subdirectory()` you need to do `include("[path_of_the_file]/opencv_build_options.cmake")`.

## For maintainers

### Running the tests

Simply use "tests/CMakeLists.txt" to generate a project, then run it.<br/>
If you are using VSCode and the CMake extension, this project already contains a *.vscode/settings.json* that will use the right CMakeLists.txt automatically.

### BUILD FOR LINUX
you may need to install with the line `sudo apt-get install libgtk-3-dev`
