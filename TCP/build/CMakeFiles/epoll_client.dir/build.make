# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

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
CMAKE_SOURCE_DIR = /home/x/Demo/TCP

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/x/Demo/TCP/build

# Include any dependencies generated for this target.
include CMakeFiles/epoll_client.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/epoll_client.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/epoll_client.dir/flags.make

CMakeFiles/epoll_client.dir/src/epoll_client.cpp.o: CMakeFiles/epoll_client.dir/flags.make
CMakeFiles/epoll_client.dir/src/epoll_client.cpp.o: ../src/epoll_client.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/x/Demo/TCP/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/epoll_client.dir/src/epoll_client.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/epoll_client.dir/src/epoll_client.cpp.o -c /home/x/Demo/TCP/src/epoll_client.cpp

CMakeFiles/epoll_client.dir/src/epoll_client.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/epoll_client.dir/src/epoll_client.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/x/Demo/TCP/src/epoll_client.cpp > CMakeFiles/epoll_client.dir/src/epoll_client.cpp.i

CMakeFiles/epoll_client.dir/src/epoll_client.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/epoll_client.dir/src/epoll_client.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/x/Demo/TCP/src/epoll_client.cpp -o CMakeFiles/epoll_client.dir/src/epoll_client.cpp.s

CMakeFiles/epoll_client.dir/src/epoll_client.cpp.o.requires:

.PHONY : CMakeFiles/epoll_client.dir/src/epoll_client.cpp.o.requires

CMakeFiles/epoll_client.dir/src/epoll_client.cpp.o.provides: CMakeFiles/epoll_client.dir/src/epoll_client.cpp.o.requires
	$(MAKE) -f CMakeFiles/epoll_client.dir/build.make CMakeFiles/epoll_client.dir/src/epoll_client.cpp.o.provides.build
.PHONY : CMakeFiles/epoll_client.dir/src/epoll_client.cpp.o.provides

CMakeFiles/epoll_client.dir/src/epoll_client.cpp.o.provides.build: CMakeFiles/epoll_client.dir/src/epoll_client.cpp.o


# Object files for target epoll_client
epoll_client_OBJECTS = \
"CMakeFiles/epoll_client.dir/src/epoll_client.cpp.o"

# External object files for target epoll_client
epoll_client_EXTERNAL_OBJECTS =

epoll_client: CMakeFiles/epoll_client.dir/src/epoll_client.cpp.o
epoll_client: CMakeFiles/epoll_client.dir/build.make
epoll_client: CMakeFiles/epoll_client.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/x/Demo/TCP/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable epoll_client"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/epoll_client.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/epoll_client.dir/build: epoll_client

.PHONY : CMakeFiles/epoll_client.dir/build

CMakeFiles/epoll_client.dir/requires: CMakeFiles/epoll_client.dir/src/epoll_client.cpp.o.requires

.PHONY : CMakeFiles/epoll_client.dir/requires

CMakeFiles/epoll_client.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/epoll_client.dir/cmake_clean.cmake
.PHONY : CMakeFiles/epoll_client.dir/clean

CMakeFiles/epoll_client.dir/depend:
	cd /home/x/Demo/TCP/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/x/Demo/TCP /home/x/Demo/TCP /home/x/Demo/TCP/build /home/x/Demo/TCP/build /home/x/Demo/TCP/build/CMakeFiles/epoll_client.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/epoll_client.dir/depend
