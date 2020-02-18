#include <opencv2/highgui.hpp>
#include <opencv2/imgproc.hpp>

using namespace cv;

int main( int argc, char** argv )
{
    
    if( argc != 2 )//判断参数是否是两个
    {
        printf( " No image data \n " );
        return -1;
    }
    char* imageName = argv[1];

    Mat image;
    image = imread( imageName, 1 );//读入图片

    if(  !image.data)//判断是否有数据
    {
        printf( " No image data \n " );
        return -1;
    }

    namedWindow( imageName, CV_WINDOW_AUTOSIZE );
    imshow( imageName, image );//显示图片

    waitKey(0);

    return 0;
}
