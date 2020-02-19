cmake_minimum_required(VERSION 2.8.3)
project(TCP)

SET( CMAKE_CXX_FLAGS "-std=c++11 -O3")

find_package(Threads REQUIRED)


add_executable(client src/client.cpp)
add_executable(server src/server.cpp)
target_link_libraries(client Threads::Threads)
target_link_libraries(server Threads::Threads)

add_executable(epoll_client src/epoll_client.cpp)
add_executable(epoll_server src/epoll_server.cpp)
target_link_libraries(epoll_client Threads::Threads)

add_library(httpdeal src/httpdeal.cpp)
add_library(StringSplit src/StringSplit.cpp)
add_executable(httpserver src/httpserver.cpp)
target_link_libraries(httpdeal StringSplit)
target_link_libraries(httpserver httpdeal)


