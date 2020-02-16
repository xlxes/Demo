cmake_minimum_required(VERSION 2.8.3)
project(actiondemo)

find_package(catkin REQUIRED COMPONENTS
  actionlib
  actionlib_msgs
  roscpp
  rospy
  std_msgs
)

## Generate actions in the 'action' folder
 add_action_files(
   DIRECTORY action
   FILES
   DoDishes.action
 )

## Generate added messages and services with any dependencies listed here
 generate_messages(
   DEPENDENCIES
   actionlib_msgs#   std_msgs
 )

catkin_package()

###########
## Build ##
###########
include_directories(
  ${catkin_INCLUDE_DIRS}
)

## Declare a C++ executable
add_executable(do_dishes_action_client_node src/do_dishes_action_client_node.cpp)
add_executable(do_dishes_action_client_node1 src/do_dishes_action_client_node1.cpp)
add_executable(do_dishes_action_server_node src/do_dishes_action_server_node.cpp)

## Add cmake target dependencies of the executable
## same as for the library above
 add_dependencies(do_dishes_action_client_node ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
 add_dependencies(do_dishes_action_client_node1 ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
add_dependencies(do_dishes_action_server_node ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
## Specify libraries to link a library or executable target against
 target_link_libraries(do_dishes_action_client_node
   ${catkin_LIBRARIES}
 )
  target_link_libraries(do_dishes_action_client_node1
   ${catkin_LIBRARIES}
 )
 target_link_libraries(do_dishes_action_server_node
   ${catkin_LIBRARIES}
 )