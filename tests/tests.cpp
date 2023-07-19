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