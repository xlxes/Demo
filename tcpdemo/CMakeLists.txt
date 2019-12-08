cmake_minimum_required(VERSION 2.8.3)
project(rt)

SET( CMAKE_CXX_FLAGS "-std=c++11 -O3")

find_package(Threads REQUIRED)



add_executable(client src/client.cpp)
add_executable(server src/server.cpp)
add_executable(client2 src/client2.cpp)
add_executable(server2 src/server2.cpp)
add_executable(client3 src/client3.cpp)
add_executable(server3 src/server3.cpp)
add_executable(c1 src/c1.cpp)
add_executable(s1 src/s1.cpp)

target_link_libraries(s1 Threads::Threads)
target_link_libraries(c1 Threads::Threads)
