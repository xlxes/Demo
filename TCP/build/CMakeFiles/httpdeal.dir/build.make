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
include CMakeFiles/httpdeal.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/httpdeal.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/httpdeal.dir/flags.make

CMakeFiles/httpdeal.dir/src/httpdeal.cpp.o: CMakeFiles/httpdeal.dir/flags.make
CMakeFiles/httpdeal.dir/src/httpdeal.cpp.o: ../src/httpdeal.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/x/Demo/TCP/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/httpdeal.dir/src/httpdeal.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/httpdeal.dir/src/httpdeal.cpp.o -c /home/x/Demo/TCP/src/httpdeal.cpp

CMakeFiles/httpdeal.dir/src/httpdeal.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/httpdeal.dir/src/httpdeal.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/x/Demo/TCP/src/httpdeal.cpp > CMakeFiles/httpdeal.dir/src/httpdeal.cpp.i

CMakeFiles/httpdeal.dir/src/httpdeal.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/httpdeal.dir/src/httpdeal.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/x/Demo/TCP/src/httpdeal.cpp -o CMakeFiles/httpdeal.dir/src/httpdeal.cpp.s

CMakeFiles/httpdeal.dir/src/httpdeal.cpp.o.requires:

.PHONY : CMakeFiles/httpdeal.dir/src/httpdeal.cpp.o.requires

CMakeFiles/httpdeal.dir/src/httpdeal.cpp.o.provides: CMakeFiles/httpdeal.dir/src/httpdeal.cpp.o.requires
	$(MAKE) -f CMakeFiles/httpdeal.dir/build.make CMakeFiles/httpdeal.dir/src/httpdeal.cpp.o.provides.build
.PHONY : CMakeFiles/httpdeal.dir/src/httpdeal.cpp.o.provides

CMakeFiles/httpdeal.dir/src/httpdeal.cpp.o.provides.build: CMakeFiles/httpdeal.dir/src/httpdeal.cpp.o


# Object files for target httpdeal
httpdeal_OBJECTS = \
"CMakeFiles/httpdeal.dir/src/httpdeal.cpp.o"

# External object files for target httpdeal
httpdeal_EXTERNAL_OBJECTS =

libhttpdeal.a: CMakeFiles/httpdeal.dir/src/httpdeal.cpp.o
libhttpdeal.a: CMakeFiles/httpdeal.dir/build.make
libhttpdeal.a: CMakeFiles/httpdeal.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/x/Demo/TCP/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX static library libhttpdeal.a"
	$(CMAKE_COMMAND) -P CMakeFiles/httpdeal.dir/cmake_clean_target.cmake
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/httpdeal.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/httpdeal.dir/build: libhttpdeal.a

.PHONY : CMakeFiles/httpdeal.dir/build

CMakeFiles/httpdeal.dir/requires: CMakeFiles/httpdeal.dir/src/httpdeal.cpp.o.requires

.PHONY : CMakeFiles/httpdeal.dir/requires

CMakeFiles/httpdeal.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/httpdeal.dir/cmake_clean.cmake
.PHONY : CMakeFiles/httpdeal.dir/clean

CMakeFiles/httpdeal.dir/depend:
	cd /home/x/Demo/TCP/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/x/Demo/TCP /home/x/Demo/TCP /home/x/Demo/TCP/build /home/x/Demo/TCP/build /home/x/Demo/TCP/build/CMakeFiles/httpdeal.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/httpdeal.dir/depend
