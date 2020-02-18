1.      建立基本编译环境

sudo apt-get install build-essential

 2.      安装OpenGL Library

sudo apt-get install libgl1-mesa-dev

 3.      安装OpenGL Utilities

sudo apt-get install libglu1-mesa-dev

 4.      安装OpenGL Utility ToolKit

sudo apt-get install freeglut3-dev


try: glxinfo in bash
if :Error: couldn't find RGB GLX visual or fbconfig ubuntu 12.04 error.
then :sudo apt-get remove --purge xserver-xorg

      sudo apt-get install xserver-xorg

      sudo dpkg-reconfigure xserver-xorg
      sudo reboot




build: gcc -o test test.c -lGL -lGLU -lglut


其实opengl的程序的cmake写法很简单，因为在linux下，头文件已经自动放到系统include路径了，因此只需要在链接的时候加入链接库，和前面用gcc/g++编译的设定几乎一致，无非是把参数写在CMakeLists.txt中。比如用clion作为IDE，那么对应的CMakeLists.txt为：

cmake_minimum_required(VERSION 3.3)
project(hello)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")

set(SOURCE_FILES main.cpp)
add_executable(hello ${SOURCE_FILES})
target_link_libraries(${PROJECT_NAME} GL GLU glut)   #此行为新增




