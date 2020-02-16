# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "actiondemo: 7 messages, 0 services")

set(MSG_I_FLAGS "-Iactiondemo:/home/x/demo/rosdemo/devel/share/actiondemo/msg;-Iactionlib_msgs:/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(actiondemo_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesResult.msg" NAME_WE)
add_custom_target(_actiondemo_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "actiondemo" "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesResult.msg" ""
)

get_filename_component(_filename "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesActionGoal.msg" NAME_WE)
add_custom_target(_actiondemo_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "actiondemo" "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesActionGoal.msg" "actiondemo/DoDishesGoal:actionlib_msgs/GoalID:std_msgs/Header"
)

get_filename_component(_filename "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesAction.msg" NAME_WE)
add_custom_target(_actiondemo_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "actiondemo" "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesAction.msg" "actiondemo/DoDishesFeedback:std_msgs/Header:actiondemo/DoDishesActionFeedback:actiondemo/DoDishesGoal:actiondemo/DoDishesResult:actiondemo/DoDishesActionGoal:actiondemo/DoDishesActionResult:actionlib_msgs/GoalID:actionlib_msgs/GoalStatus"
)

get_filename_component(_filename "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesActionFeedback.msg" NAME_WE)
add_custom_target(_actiondemo_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "actiondemo" "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesActionFeedback.msg" "actiondemo/DoDishesFeedback:actionlib_msgs/GoalID:std_msgs/Header:actionlib_msgs/GoalStatus"
)

get_filename_component(_filename "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesActionResult.msg" NAME_WE)
add_custom_target(_actiondemo_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "actiondemo" "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesActionResult.msg" "actionlib_msgs/GoalID:std_msgs/Header:actiondemo/DoDishesResult:actionlib_msgs/GoalStatus"
)

get_filename_component(_filename "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesFeedback.msg" NAME_WE)
add_custom_target(_actiondemo_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "actiondemo" "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesFeedback.msg" ""
)

get_filename_component(_filename "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesGoal.msg" NAME_WE)
add_custom_target(_actiondemo_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "actiondemo" "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesGoal.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(actiondemo
  "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/actiondemo
)
_generate_msg_cpp(actiondemo
  "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesGoal.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/actiondemo
)
_generate_msg_cpp(actiondemo
  "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesAction.msg"
  "${MSG_I_FLAGS}"
  "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesFeedback.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesActionFeedback.msg;/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesGoal.msg;/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesResult.msg;/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesActionGoal.msg;/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesActionResult.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/actiondemo
)
_generate_msg_cpp(actiondemo
  "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesFeedback.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/actiondemo
)
_generate_msg_cpp(actiondemo
  "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesResult.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/actiondemo
)
_generate_msg_cpp(actiondemo
  "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/actiondemo
)
_generate_msg_cpp(actiondemo
  "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/actiondemo
)

### Generating Services

### Generating Module File
_generate_module_cpp(actiondemo
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/actiondemo
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(actiondemo_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(actiondemo_generate_messages actiondemo_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesResult.msg" NAME_WE)
add_dependencies(actiondemo_generate_messages_cpp _actiondemo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesActionGoal.msg" NAME_WE)
add_dependencies(actiondemo_generate_messages_cpp _actiondemo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesAction.msg" NAME_WE)
add_dependencies(actiondemo_generate_messages_cpp _actiondemo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesActionFeedback.msg" NAME_WE)
add_dependencies(actiondemo_generate_messages_cpp _actiondemo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesActionResult.msg" NAME_WE)
add_dependencies(actiondemo_generate_messages_cpp _actiondemo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesFeedback.msg" NAME_WE)
add_dependencies(actiondemo_generate_messages_cpp _actiondemo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesGoal.msg" NAME_WE)
add_dependencies(actiondemo_generate_messages_cpp _actiondemo_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(actiondemo_gencpp)
add_dependencies(actiondemo_gencpp actiondemo_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS actiondemo_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(actiondemo
  "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/actiondemo
)
_generate_msg_eus(actiondemo
  "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesGoal.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/actiondemo
)
_generate_msg_eus(actiondemo
  "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesAction.msg"
  "${MSG_I_FLAGS}"
  "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesFeedback.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesActionFeedback.msg;/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesGoal.msg;/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesResult.msg;/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesActionGoal.msg;/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesActionResult.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/actiondemo
)
_generate_msg_eus(actiondemo
  "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesFeedback.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/actiondemo
)
_generate_msg_eus(actiondemo
  "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesResult.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/actiondemo
)
_generate_msg_eus(actiondemo
  "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/actiondemo
)
_generate_msg_eus(actiondemo
  "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/actiondemo
)

### Generating Services

### Generating Module File
_generate_module_eus(actiondemo
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/actiondemo
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(actiondemo_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(actiondemo_generate_messages actiondemo_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesResult.msg" NAME_WE)
add_dependencies(actiondemo_generate_messages_eus _actiondemo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesActionGoal.msg" NAME_WE)
add_dependencies(actiondemo_generate_messages_eus _actiondemo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesAction.msg" NAME_WE)
add_dependencies(actiondemo_generate_messages_eus _actiondemo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesActionFeedback.msg" NAME_WE)
add_dependencies(actiondemo_generate_messages_eus _actiondemo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesActionResult.msg" NAME_WE)
add_dependencies(actiondemo_generate_messages_eus _actiondemo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesFeedback.msg" NAME_WE)
add_dependencies(actiondemo_generate_messages_eus _actiondemo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesGoal.msg" NAME_WE)
add_dependencies(actiondemo_generate_messages_eus _actiondemo_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(actiondemo_geneus)
add_dependencies(actiondemo_geneus actiondemo_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS actiondemo_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(actiondemo
  "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/actiondemo
)
_generate_msg_lisp(actiondemo
  "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesGoal.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/actiondemo
)
_generate_msg_lisp(actiondemo
  "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesAction.msg"
  "${MSG_I_FLAGS}"
  "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesFeedback.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesActionFeedback.msg;/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesGoal.msg;/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesResult.msg;/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesActionGoal.msg;/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesActionResult.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/actiondemo
)
_generate_msg_lisp(actiondemo
  "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesFeedback.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/actiondemo
)
_generate_msg_lisp(actiondemo
  "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesResult.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/actiondemo
)
_generate_msg_lisp(actiondemo
  "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/actiondemo
)
_generate_msg_lisp(actiondemo
  "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/actiondemo
)

### Generating Services

### Generating Module File
_generate_module_lisp(actiondemo
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/actiondemo
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(actiondemo_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(actiondemo_generate_messages actiondemo_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesResult.msg" NAME_WE)
add_dependencies(actiondemo_generate_messages_lisp _actiondemo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesActionGoal.msg" NAME_WE)
add_dependencies(actiondemo_generate_messages_lisp _actiondemo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesAction.msg" NAME_WE)
add_dependencies(actiondemo_generate_messages_lisp _actiondemo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesActionFeedback.msg" NAME_WE)
add_dependencies(actiondemo_generate_messages_lisp _actiondemo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesActionResult.msg" NAME_WE)
add_dependencies(actiondemo_generate_messages_lisp _actiondemo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesFeedback.msg" NAME_WE)
add_dependencies(actiondemo_generate_messages_lisp _actiondemo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesGoal.msg" NAME_WE)
add_dependencies(actiondemo_generate_messages_lisp _actiondemo_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(actiondemo_genlisp)
add_dependencies(actiondemo_genlisp actiondemo_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS actiondemo_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(actiondemo
  "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/actiondemo
)
_generate_msg_nodejs(actiondemo
  "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesGoal.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/actiondemo
)
_generate_msg_nodejs(actiondemo
  "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesAction.msg"
  "${MSG_I_FLAGS}"
  "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesFeedback.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesActionFeedback.msg;/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesGoal.msg;/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesResult.msg;/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesActionGoal.msg;/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesActionResult.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/actiondemo
)
_generate_msg_nodejs(actiondemo
  "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesFeedback.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/actiondemo
)
_generate_msg_nodejs(actiondemo
  "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesResult.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/actiondemo
)
_generate_msg_nodejs(actiondemo
  "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/actiondemo
)
_generate_msg_nodejs(actiondemo
  "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/actiondemo
)

### Generating Services

### Generating Module File
_generate_module_nodejs(actiondemo
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/actiondemo
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(actiondemo_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(actiondemo_generate_messages actiondemo_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesResult.msg" NAME_WE)
add_dependencies(actiondemo_generate_messages_nodejs _actiondemo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesActionGoal.msg" NAME_WE)
add_dependencies(actiondemo_generate_messages_nodejs _actiondemo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesAction.msg" NAME_WE)
add_dependencies(actiondemo_generate_messages_nodejs _actiondemo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesActionFeedback.msg" NAME_WE)
add_dependencies(actiondemo_generate_messages_nodejs _actiondemo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesActionResult.msg" NAME_WE)
add_dependencies(actiondemo_generate_messages_nodejs _actiondemo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesFeedback.msg" NAME_WE)
add_dependencies(actiondemo_generate_messages_nodejs _actiondemo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesGoal.msg" NAME_WE)
add_dependencies(actiondemo_generate_messages_nodejs _actiondemo_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(actiondemo_gennodejs)
add_dependencies(actiondemo_gennodejs actiondemo_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS actiondemo_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(actiondemo
  "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/actiondemo
)
_generate_msg_py(actiondemo
  "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesGoal.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/actiondemo
)
_generate_msg_py(actiondemo
  "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesAction.msg"
  "${MSG_I_FLAGS}"
  "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesFeedback.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesActionFeedback.msg;/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesGoal.msg;/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesResult.msg;/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesActionGoal.msg;/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesActionResult.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/actiondemo
)
_generate_msg_py(actiondemo
  "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesFeedback.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/actiondemo
)
_generate_msg_py(actiondemo
  "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesResult.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/actiondemo
)
_generate_msg_py(actiondemo
  "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/actiondemo
)
_generate_msg_py(actiondemo
  "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/actiondemo
)

### Generating Services

### Generating Module File
_generate_module_py(actiondemo
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/actiondemo
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(actiondemo_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(actiondemo_generate_messages actiondemo_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesResult.msg" NAME_WE)
add_dependencies(actiondemo_generate_messages_py _actiondemo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesActionGoal.msg" NAME_WE)
add_dependencies(actiondemo_generate_messages_py _actiondemo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesAction.msg" NAME_WE)
add_dependencies(actiondemo_generate_messages_py _actiondemo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesActionFeedback.msg" NAME_WE)
add_dependencies(actiondemo_generate_messages_py _actiondemo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesActionResult.msg" NAME_WE)
add_dependencies(actiondemo_generate_messages_py _actiondemo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesFeedback.msg" NAME_WE)
add_dependencies(actiondemo_generate_messages_py _actiondemo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/x/demo/rosdemo/devel/share/actiondemo/msg/DoDishesGoal.msg" NAME_WE)
add_dependencies(actiondemo_generate_messages_py _actiondemo_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(actiondemo_genpy)
add_dependencies(actiondemo_genpy actiondemo_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS actiondemo_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/actiondemo)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/actiondemo
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_cpp)
  add_dependencies(actiondemo_generate_messages_cpp actionlib_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/actiondemo)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/actiondemo
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_eus)
  add_dependencies(actiondemo_generate_messages_eus actionlib_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/actiondemo)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/actiondemo
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_lisp)
  add_dependencies(actiondemo_generate_messages_lisp actionlib_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/actiondemo)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/actiondemo
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_nodejs)
  add_dependencies(actiondemo_generate_messages_nodejs actionlib_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/actiondemo)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/actiondemo\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/actiondemo
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_py)
  add_dependencies(actiondemo_generate_messages_py actionlib_msgs_generate_messages_py)
endif()
