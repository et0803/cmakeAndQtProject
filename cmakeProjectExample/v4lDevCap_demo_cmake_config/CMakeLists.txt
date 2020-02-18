cmake_minimum_required(VERSION 2.8)
project(v4lDevCap.cpp)

find_package(OpenCV REQUIRED)
add_executable(v4lDevCap v4lDevCap.cpp)

target_link_libraries(v4lDevCap ${OpenCV_LIBS})
