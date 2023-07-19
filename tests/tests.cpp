#include <iostream>
#include <opencv2/opencv.hpp>

auto main() -> int
{
    auto video_capture = cv::VideoCapture{0};
    if (!video_capture.isOpened())
    {
        std::cout << "Cannot access webcam.\n";
        return -1;
    }

    auto image = cv::Mat{};
    while (cv::waitKey(1) != 27 /*ESCAPE*/)
    {
        video_capture >> image;
        cv::imshow("Hello OpenCV - Press ESCAPE to close me", image);
    }
}