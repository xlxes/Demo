cmake_minimum_required(VERSION 2.8.3)
project(UDP)

SET( CMAKE_CXX_FLAGS "-std=c++11 -O3")

find_package(Threads REQUIRED)

add_executable(client src/client.cpp)
add_executable(server src/server.cpp)

