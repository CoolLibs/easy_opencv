#include <opencv2/highgui/highgui.hpp>
#include <opencv2/opencv.hpp>

auto main() -> int
{
    cv::VideoCapture cap{0};
    if (!cap.isOpened())
    {
        std::cout << "Cannot access webcam.\n";
        return 0;
    }

    cv::Mat image;
    while (true)
    {
        cap >> image;
        cv::imshow("Hello OpenCV", image);
        cv::waitKey(25);
    }
}