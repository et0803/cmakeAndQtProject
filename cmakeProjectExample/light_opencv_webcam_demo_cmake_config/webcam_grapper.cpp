#include "cxcore.h"
#include "highgui.h"
#include "cv.h"
using namespace std;

int main()
{ 
IplImage* pFrame = NULL;
cvNamedWindow("result", 1);
CvCapture* pCapture = cvCreateCameraCapture(-1);
cvSetCaptureProperty(pCapture,CV_CAP_PROP_FRAME_WIDTH,640);
cvSetCaptureProperty(pCapture,CV_CAP_PROP_FRAME_HEIGHT,480);

while(true)
{
pFrame = cvQueryFrame( pCapture );
if(!pFrame) break;

char c = cvWaitKey(33);
if(c == 32) break;
cvShowImage("result", pFrame);
}

return 0;
}
