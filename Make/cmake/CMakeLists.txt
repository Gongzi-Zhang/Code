cmake_minimum_required(VERSION 2.6 FATAL_ERROR)
project(TEST)

find_program(ROOT_CONFIG_EXECUTABLE root-config PATHS $ENV{ROOTSYS}/bin)
# message(STATUS "${ROOT_CONFIG_EXECUTABLE}")

if(NOT ROOT_CONFIG_EXECUTABLE)
    set(ROOT_FOUND FALSE)
else()
    set(ROOT_FOUND TRUE)
    execute_process(
	COMMAND ${ROOT_CONFIG_EXECUTABLE} --prefix
	OUTPUT_VARIABLE ROOTSYS
	OUTPUT_STRIP_TRAILING_WHITESPACE)
    if(NOT ROOT_FIND_QUIETLY)
	message(STATUS "FOUND ROOT in ${ROOTSYS}" )
    endif()
endif()

set(TEST
    value1
    value2
    value3)
message(STATUS ${TEST})
