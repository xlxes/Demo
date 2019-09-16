cmake_minimum_required(VERSION 2.8.3)
project(rt)

SET( CMAKE_CXX_FLAGS "-std=c++11 -O3")



add_executable(client src/client.cpp)
add_executable(server src/server.cpp)
