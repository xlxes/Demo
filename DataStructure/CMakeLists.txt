cmake_minimum_required(VERSION 2.8.3)
project(DataStructure)

SET( CMAKE_CXX_FLAGS "-std=c++11 -O0")
SET( CMAKE_BUILD_TYPE "Debug")

add_executable(Data src/data.cpp)
