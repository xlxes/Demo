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
include uartdemo/CMakeFiles/com.dir/depend.make

# Include the progress variables for this target.
include uartdemo/CMakeFiles/com.dir/progress.make

# Include the compile flags for this target's objects.
include uartdemo/CMakeFiles/com.dir/flags.make

uartdemo/CMakeFiles/com.dir/src/com.cpp.o: uartdemo/CMakeFiles/com.dir/flags.make
uartdemo/CMakeFiles/com.dir/src/com.cpp.o: /home/x/demo/rosdemo/src/uartdemo/src/com.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/x/demo/rosdemo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object uartdemo/CMakeFiles/com.dir/src/com.cpp.o"
	cd /home/x/demo/rosdemo/build/uartdemo && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/com.dir/src/com.cpp.o -c /home/x/demo/rosdemo/src/uartdemo/src/com.cpp

uartdemo/CMakeFiles/com.dir/src/com.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/com.dir/src/com.cpp.i"
	cd /home/x/demo/rosdemo/build/uartdemo && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/x/demo/rosdemo/src/uartdemo/src/com.cpp > CMakeFiles/com.dir/src/com.cpp.i

uartdemo/CMakeFiles/com.dir/src/com.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/com.dir/src/com.cpp.s"
	cd /home/x/demo/rosdemo/build/uartdemo && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/x/demo/rosdemo/src/uartdemo/src/com.cpp -o CMakeFiles/com.dir/src/com.cpp.s

uartdemo/CMakeFiles/com.dir/src/com.cpp.o.requires:

.PHONY : uartdemo/CMakeFiles/com.dir/src/com.cpp.o.requires

uartdemo/CMakeFiles/com.dir/src/com.cpp.o.provides: uartdemo/CMakeFiles/com.dir/src/com.cpp.o.requires
	$(MAKE) -f uartdemo/CMakeFiles/com.dir/build.make uartdemo/CMakeFiles/com.dir/src/com.cpp.o.provides.build
.PHONY : uartdemo/CMakeFiles/com.dir/src/com.cpp.o.provides

uartdemo/CMakeFiles/com.dir/src/com.cpp.o.provides.build: uartdemo/CMakeFiles/com.dir/src/com.cpp.o


# Object files for target com
com_OBJECTS = \
"CMakeFiles/com.dir/src/com.cpp.o"

# External object files for target com
com_EXTERNAL_OBJECTS =

/home/x/demo/rosdemo/devel/lib/libcom.so: uartdemo/CMakeFiles/com.dir/src/com.cpp.o
/home/x/demo/rosdemo/devel/lib/libcom.so: uartdemo/CMakeFiles/com.dir/build.make
/home/x/demo/rosdemo/devel/lib/libcom.so: uartdemo/CMakeFiles/com.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/x/demo/rosdemo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX shared library /home/x/demo/rosdemo/devel/lib/libcom.so"
	cd /home/x/demo/rosdemo/build/uartdemo && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/com.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
uartdemo/CMakeFiles/com.dir/build: /home/x/demo/rosdemo/devel/lib/libcom.so

.PHONY : uartdemo/CMakeFiles/com.dir/build

uartdemo/CMakeFiles/com.dir/requires: uartdemo/CMakeFiles/com.dir/src/com.cpp.o.requires

.PHONY : uartdemo/CMakeFiles/com.dir/requires

uartdemo/CMakeFiles/com.dir/clean:
	cd /home/x/demo/rosdemo/build/uartdemo && $(CMAKE_COMMAND) -P CMakeFiles/com.dir/cmake_clean.cmake
.PHONY : uartdemo/CMakeFiles/com.dir/clean

uartdemo/CMakeFiles/com.dir/depend:
	cd /home/x/demo/rosdemo/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/x/demo/rosdemo/src /home/x/demo/rosdemo/src/uartdemo /home/x/demo/rosdemo/build /home/x/demo/rosdemo/build/uartdemo /home/x/demo/rosdemo/build/uartdemo/CMakeFiles/com.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : uartdemo/CMakeFiles/com.dir/depend

