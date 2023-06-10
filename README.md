# easy_opencv

## Including

To add this library to your project, simply add these two lines to your *CMakeLists.txt*:
```cmake
link_opencv(${PROJECT_NAME} visibility)
```
**visibility** parameter can be PUBLIC or PRIVATE according your needs

Then include it as:
```cpp
#include <easy_opencv/easy_opencv.hpp>
```

## Running the tests

Simply use "tests/CMakeLists.txt" to generate a project, then run it.<br/>
If you are using VSCode and the CMake extension, this project already contains a *.vscode/settings.json* that will use the right CMakeLists.txt automatically.



## Updating OpenCV

**For all plateform**
In the `opencv/include` folder, change it with the updated `build/include` folder of your version

**For Windows**
In the `opencv/cv16` folder, change `bin` and `lib` folders with the updated `build/x64/vc1X/bin` and `build/x64/vc1X/lib` files (you just need the `.dll` files for the `bin` folder and just the `.lib` for the `lib` folder)

In the "CMakeLists.txt" file change `opencv_world470`, `opencv_videoio_msmf470_64`, `opencv_videoio_ffmpeg470_64` by the name of the new version files - you will probably just need to change 470 (for the version in Coollab : 4.7.0) by the number of your version.