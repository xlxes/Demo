# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/x/demo/rosdemo/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/x/demo/rosdemo/build

# Include any dependencies generated for this target.
include server_client_cpp/CMakeFiles/client.dir/depend.make

# Include the progress variables for this target.
include server_client_cpp/CMakeFiles/client.dir/progress.make

# Include the compile flags for this target's objects.
include server_client_cpp/CMakeFiles/client.dir/flags.make

server_client_cpp/CMakeFiles/client.dir/src/client.cpp.o: server_client_cpp/CMakeFiles/client.dir/flags.make
server_client_cpp/CMakeFiles/client.dir/src/client.cpp.o: /home/x/demo/rosdemo/src/server_client_cpp/src/client.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/x/demo/rosdemo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object server_client_cpp/CMakeFiles/client.dir/src/client.cpp.o"
	cd /home/x/demo/rosdemo/build/server_client_cpp && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/client.dir/src/client.cpp.o -c /home/x/demo/rosdemo/src/server_client_cpp/src/client.cpp

server_client_cpp/CMakeFiles/client.dir/src/client.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/client.dir/src/client.cpp.i"
	cd /home/x/demo/rosdemo/build/server_client_cpp && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/x/demo/rosdemo/src/server_client_cpp/src/client.cpp > CMakeFiles/client.dir/src/client.cpp.i

server_client_cpp/CMakeFiles/client.dir/src/client.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/client.dir/src/client.cpp.s"
	cd /home/x/demo/rosdemo/build/server_client_cpp && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/x/demo/rosdemo/src/server_client_cpp/src/client.cpp -o CMakeFiles/client.dir/src/client.cpp.s

server_client_cpp/CMakeFiles/client.dir/src/client.cpp.o.requires:

.PHONY : server_client_cpp/CMakeFiles/client.dir/src/client.cpp.o.requires

server_client_cpp/CMakeFiles/client.dir/src/client.cpp.o.provides: server_client_cpp/CMakeFiles/client.dir/src/client.cpp.o.requires
	$(MAKE) -f server_client_cpp/CMakeFiles/client.dir/build.make server_client_cpp/CMakeFiles/client.dir/src/client.cpp.o.provides.build
.PHONY : server_client_cpp/CMakeFiles/client.dir/src/client.cpp.o.provides

server_client_cpp/CMakeFiles/client.dir/src/client.cpp.o.provides.build: server_client_cpp/CMakeFiles/client.dir/src/client.cpp.o


# Object files for target client
client_OBJECTS = \
"CMakeFiles/client.dir/src/client.cpp.o"

# External object files for target client
client_EXTERNAL_OBJECTS =

/home/x/demo/rosdemo/devel/lib/server_client_cpp/client: server_client_cpp/CMakeFiles/client.dir/src/client.cpp.o
/home/x/demo/rosdemo/devel/lib/server_client_cpp/client: server_client_cpp/CMakeFiles/client.dir/build.make
/home/x/demo/rosdemo/devel/lib/server_client_cpp/client: /opt/ros/kinetic/lib/libroscpp.so
/home/x/demo/rosdemo/devel/lib/server_client_cpp/client: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so
/home/x/demo/rosdemo/devel/lib/server_client_cpp/client: /usr/lib/x86_64-linux-gnu/libboost_signals.so
/home/x/demo/rosdemo/devel/lib/server_client_cpp/client: /opt/ros/kinetic/lib/librosconsole.so
/home/x/demo/rosdemo/devel/lib/server_client_cpp/client: /opt/ros/kinetic/lib/librosconsole_log4cxx.so
/home/x/demo/rosdemo/devel/lib/server_client_cpp/client: /opt/ros/kinetic/lib/librosconsole_backend_interface.so
/home/x/demo/rosdemo/devel/lib/server_client_cpp/client: /usr/lib/x86_64-linux-gnu/liblog4cxx.so
/home/x/demo/rosdemo/devel/lib/server_client_cpp/client: /usr/lib/x86_64-linux-gnu/libboost_regex.so
/home/x/demo/rosdemo/devel/lib/server_client_cpp/client: /opt/ros/kinetic/lib/libxmlrpcpp.so
/home/x/demo/rosdemo/devel/lib/server_client_cpp/client: /opt/ros/kinetic/lib/libroscpp_serialization.so
/home/x/demo/rosdemo/devel/lib/server_client_cpp/client: /opt/ros/kinetic/lib/librostime.so
/home/x/demo/rosdemo/devel/lib/server_client_cpp/client: /opt/ros/kinetic/lib/libcpp_common.so
/home/x/demo/rosdemo/devel/lib/server_client_cpp/client: /usr/lib/x86_64-linux-gnu/libboost_system.so
/home/x/demo/rosdemo/devel/lib/server_client_cpp/client: /usr/lib/x86_64-linux-gnu/libboost_thread.so
/home/x/demo/rosdemo/devel/lib/server_client_cpp/client: /usr/lib/x86_64-linux-gnu/libboost_chrono.so
/home/x/demo/rosdemo/devel/lib/server_client_cpp/client: /usr/lib/x86_64-linux-gnu/libboost_date_time.so
/home/x/demo/rosdemo/devel/lib/server_client_cpp/client: /usr/lib/x86_64-linux-gnu/libboost_atomic.so
/home/x/demo/rosdemo/devel/lib/server_client_cpp/client: /usr/lib/x86_64-linux-gnu/libpthread.so
/home/x/demo/rosdemo/devel/lib/server_client_cpp/client: /usr/lib/x86_64-linux-gnu/libconsole_bridge.so
/home/x/demo/rosdemo/devel/lib/server_client_cpp/client: server_client_cpp/CMakeFiles/client.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/x/demo/rosdemo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable /home/x/demo/rosdemo/devel/lib/server_client_cpp/client"
	cd /home/x/demo/rosdemo/build/server_client_cpp && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/client.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
server_client_cpp/CMakeFiles/client.dir/build: /home/x/demo/rosdemo/devel/lib/server_client_cpp/client

.PHONY : server_client_cpp/CMakeFiles/client.dir/build

server_client_cpp/CMakeFiles/client.dir/requires: server_client_cpp/CMakeFiles/client.dir/src/client.cpp.o.requires

.PHONY : server_client_cpp/CMakeFiles/client.dir/requires

server_client_cpp/CMakeFiles/client.dir/clean:
	cd /home/x/demo/rosdemo/build/server_client_cpp && $(CMAKE_COMMAND) -P CMakeFiles/client.dir/cmake_clean.cmake
.PHONY : server_client_cpp/CMakeFiles/client.dir/clean

server_client_cpp/CMakeFiles/client.dir/depend:
	cd /home/x/demo/rosdemo/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/x/demo/rosdemo/src /home/x/demo/rosdemo/src/server_client_cpp /home/x/demo/rosdemo/build /home/x/demo/rosdemo/build/server_client_cpp /home/x/demo/rosdemo/build/server_client_cpp/CMakeFiles/client.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : server_client_cpp/CMakeFiles/client.dir/depend

