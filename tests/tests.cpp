#include <opencv2/highgui/highgui.hpp>
#include <opencv2/opencv.hpp>

auto main(int argc, char* argv[]) -> int
{
    bool const is_CI = argc >= 2 && strcmp(argv[1], "-CI") == 0; // NOLINT(cppcoreguidelines-pro-bounds-pointer-arithmetic)

    // cv::Mat image;
    // (void)image;
    if (is_CI)
        return 0; // In CI, knowing that the executable can run and doesn't give a "missing dll" error at runtime is enough.

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