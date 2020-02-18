#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include<string.h>
#include <sys/ioctl.h>
#include <linux/videodev2.h>

int main(int argc, char *argv[])
{
    int fd;
    struct v4l2_capability video_cap;
    char *videoDevName;


    if(argv[1]!=NULL){
        videoDevName = argv[1];
        printf("%s\n",argv[0]);
        printf("%s\n",argv[1]);
    }
    else
        videoDevName="/dev/video0";



    if((fd = open(videoDevName, O_RDONLY)) == -1){
        perror("cam_info: Can't open device");
        return 1;
    }

    if(ioctl(fd, VIDIOC_QUERYCAP, &video_cap) == -1)
        perror("cam_info: Can't get capabilities");
    else {
        printf("driver:\t\t '%s'\n", video_cap.driver);
        printf("card:\t\t '%s'\n", video_cap.card);
        printf("bus_info:\t\t '%s'\n", video_cap.bus_info);
        printf("version:\t\t '%u'\n", video_cap.version);
        printf("capabilities:\t\t '%u'\n", video_cap.capabilities);
        printf("device_caps:\t\t '%u'\n", video_cap.device_caps);
    }


    close(fd);
    return 0;
}
