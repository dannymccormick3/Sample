# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

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
CMAKE_SOURCE_DIR = /home/vagrant/projects/assignment-6-dannymccormick3/part2

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/vagrant/projects/assignment-6-dannymccormick3/part2/build

# Include any dependencies generated for this target.
include CMakeFiles/mqueue_s.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/mqueue_s.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/mqueue_s.dir/flags.make

CMakeFiles/mqueue_s.dir/mqueue_s.cpp.o: CMakeFiles/mqueue_s.dir/flags.make
CMakeFiles/mqueue_s.dir/mqueue_s.cpp.o: ../mqueue_s.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/vagrant/projects/assignment-6-dannymccormick3/part2/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/mqueue_s.dir/mqueue_s.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/mqueue_s.dir/mqueue_s.cpp.o -c /home/vagrant/projects/assignment-6-dannymccormick3/part2/mqueue_s.cpp

CMakeFiles/mqueue_s.dir/mqueue_s.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mqueue_s.dir/mqueue_s.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/vagrant/projects/assignment-6-dannymccormick3/part2/mqueue_s.cpp > CMakeFiles/mqueue_s.dir/mqueue_s.cpp.i

CMakeFiles/mqueue_s.dir/mqueue_s.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mqueue_s.dir/mqueue_s.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/vagrant/projects/assignment-6-dannymccormick3/part2/mqueue_s.cpp -o CMakeFiles/mqueue_s.dir/mqueue_s.cpp.s

CMakeFiles/mqueue_s.dir/mqueue_s.cpp.o.requires:
.PHONY : CMakeFiles/mqueue_s.dir/mqueue_s.cpp.o.requires

CMakeFiles/mqueue_s.dir/mqueue_s.cpp.o.provides: CMakeFiles/mqueue_s.dir/mqueue_s.cpp.o.requires
	$(MAKE) -f CMakeFiles/mqueue_s.dir/build.make CMakeFiles/mqueue_s.dir/mqueue_s.cpp.o.provides.build
.PHONY : CMakeFiles/mqueue_s.dir/mqueue_s.cpp.o.provides

CMakeFiles/mqueue_s.dir/mqueue_s.cpp.o.provides.build: CMakeFiles/mqueue_s.dir/mqueue_s.cpp.o

# Object files for target mqueue_s
mqueue_s_OBJECTS = \
"CMakeFiles/mqueue_s.dir/mqueue_s.cpp.o"

# External object files for target mqueue_s
mqueue_s_EXTERNAL_OBJECTS =

mqueue_s: CMakeFiles/mqueue_s.dir/mqueue_s.cpp.o
mqueue_s: CMakeFiles/mqueue_s.dir/build.make
mqueue_s: CMakeFiles/mqueue_s.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable mqueue_s"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/mqueue_s.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/mqueue_s.dir/build: mqueue_s
.PHONY : CMakeFiles/mqueue_s.dir/build

CMakeFiles/mqueue_s.dir/requires: CMakeFiles/mqueue_s.dir/mqueue_s.cpp.o.requires
.PHONY : CMakeFiles/mqueue_s.dir/requires

CMakeFiles/mqueue_s.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/mqueue_s.dir/cmake_clean.cmake
.PHONY : CMakeFiles/mqueue_s.dir/clean

CMakeFiles/mqueue_s.dir/depend:
	cd /home/vagrant/projects/assignment-6-dannymccormick3/part2/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/vagrant/projects/assignment-6-dannymccormick3/part2 /home/vagrant/projects/assignment-6-dannymccormick3/part2 /home/vagrant/projects/assignment-6-dannymccormick3/part2/build /home/vagrant/projects/assignment-6-dannymccormick3/part2/build /home/vagrant/projects/assignment-6-dannymccormick3/part2/build/CMakeFiles/mqueue_s.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/mqueue_s.dir/depend

