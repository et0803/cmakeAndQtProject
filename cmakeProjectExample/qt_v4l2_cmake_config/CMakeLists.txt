cmake_minimum_required(VERSION 2.8)
project(v4l2Grapper)

find_package(Qt5Widgets REQUIRED)

include_directories(${Qt5Widgets_INCLUDE_DIRS})

message("${Qt5Widgets_INCLUDE_DIRS}")

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")

add_definitions(${Qt5Widgets_DEFINITIONS})

add_executable(${PROJECT_NAME} v4l2Grapper.cpp)

target_link_libraries(${PROJECT_NAME} Qt5::Widgets)
