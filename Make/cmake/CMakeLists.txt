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

### Logical expression
$<BOOL:...>
#    1 if the ... is true, else 0
$<AND:?[,?]...>
#   1 if all ? are 1, else 0
$<OR:?[,?]...>
#   0 if all ? are 0, else 1
$<NOT:?>

$<STREQUAL:a,b>	# a string equal b
$<EQUAL:a,b>	# a is numeric equal b

$<CONFIG:cfg>
#   1 if config is cfg, else 0
$<PLATFORM_ID:comp>
$<C_COMPILER_ID:comp>
$<C_COMPILER_VERSION:ver>
$<CXX_COMPILER_ID:comp>
$<COMPILE_FEATURES:feature[,feature]...>
#   1 if all of the features are available for the 'head' target, else 0.
$<COMPILE_LANGUAGE:lang>
$<VERSION_GREATER:v1,v2>
#   version v1 is greater than v2
$<VERSION_LESS:v1,v2>
$<VERSION_EQUAL:v1,v2>
$<TARGET_POLICY:pol>
#   1 if the policy pol was NEW when the 'head' target was created, else 0. THis generator expression only works for a subset of policies

### informational expressions
$<CONFIG>   # config name
$<PLATFORM_ID>
$<C_COMPILER_ID>
$<CXX_COMPILER_ID>
$<C_COMPILER_VERSION>
$<CXX_COMPILER_VERSION>
$<C_COMPILER_ID>
$<TARGET_FILE:tgt>
#   full path to main file (.exe, .so, .a) where tgt is the name of a target
$<TARGET_FILE_NAME:tgt>
#   name of main file
$<TARGET_FILE_DIR:tgt> 
#   dir. of main file
$<TARGET_LINKER_FILE:tgt>
#   full path of file used to link (.lib, .so, .a) where tgt is the name of a target
$<TARGET_LINKER_FILE_NAME:tgt>
#   name of linked file
$<TARGET_LINKER_FILE_DIR:tgt> 
#   dir. of linked file
$<TARGET_SONAME_FILE:tgt>
#   full path of file with soname (.so) 
$<TARGET_SONAME_FILE_NAME:tgt>
#   name of file with soname
$<TARGET_SONAME_FILE_DIR:tgt> 
#   dir. of file with soname
$<TARGET_PDB_FILE:tgt>
#   full path to the linker generated program database file (.pdb) 
$<TARGET_PDB_FILE_NAME:tgt>
#   name of .pdb file 
$<TARGET_PDB_FILE_DIR:tgt> 
#   dir. of .pdb file
$<TARGET_PROPERTY:tgt,prop>
#   value of the property prop on the target tgt.   Note that tgt is not added as a dependency of the target this expression is evaluated on.
$<TARGET_PROPERTY:prop>
#   value of the property prop on the target on which the generator expression is evaluated
$<INSTALL_PREFIX>
#   content of the install prefix when the target is exported via install(EXPORT) and empty otherwise
$<COMPILE_LANGUAGE>

### output expressions
-I$<JOIN:$<TARGET_PROPERTY:INCLUDE_DIRECTORIES>, -I>
#   generates a string of the entries in the INCLUDE_DIRECTORIES target property with each entry preceeded by -I.
$<$<BOOL:${prop}>:-I$<JOIN:${prop}, -I>>
# a more complete expression which checks the prop is non-empty
$<0:...>    # empty string 
$<1:...>    # content of ...
$<JOIN:list, ...>
#   join the list with the content of ...
$<ANGLE-R>  # literal >
$<COMMA>    # literal ,
$<SEMICOLON>	# literal ;
$<TARGET_NAME:...>
$<LINK_ONLY:...>
$<INSTALL_INTERFACE:...>
$<BUILD_INTERFACE:...>
$<LOWER_CASE:...>   # convert to lower case
$<UPPER_CASE:...>   # convert to lower case
$<MAKE_C_IDENTIFIER:...>    # convert to a C identifier
$<TARGET_OBJECTS:objLib>    
# list of objects resulting from build o objLib. objLib must be an object of type OBJECT_LIBRARY.
