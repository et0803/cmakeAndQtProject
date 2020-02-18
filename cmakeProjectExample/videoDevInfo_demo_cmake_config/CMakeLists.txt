cmake_minimum_required(VERSION 2.8)
project(videoDevInfo)

find_package(OpenCV REQUIRED)
add_executable(videoDevInfo videoDevInfo.c)

target_link_libraries(videoDevInfo ${OpenCV_LIBS})
