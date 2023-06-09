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
#include <opencv2/highgui/highgui.hpp>
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

## For maintainers

### Running the tests

Simply use "tests/CMakeLists.txt" to generate a project, then run it.<br/>
If you are using VSCode and the CMake extension, this project already contains a *.vscode/settings.json* that will use the right CMakeLists.txt automatically.

### Updating OpenCV

If you want to update this library to use a more recent version of OpenCV:

#### For all plateforms

- Download the desired OpenCV version from https://opencv.org/releases/
- Replace the content of `opencv/include` with whatever is in `build/include` in the OpenCV folder you just downloaded.

#### For Windows

- In the `opencv/cv16` folder, change `bin` and `lib` folders with the updated `build/x64/vc1X/bin` and `build/x64/vc1X/lib` files (you just need the `.dll` files for the `bin` folder and the `.lib` for the `lib` folder).

- In *CMakeLists.txt* change `opencv_world470`, `opencv_videoio_msmf470_64` and `opencv_videoio_ffmpeg470_64` with the names of the new files (you will most likely just need to change the `470` with the new version number).


### BUILD FOR LINUX
you may need to install with the line `sudo apt-get install libgtk-3-dev`
