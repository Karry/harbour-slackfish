# - Try to find libsailfishapp
# Once done this will define
#  LIBSAILFISHAPP_FOUND - System has SailfishApp
#  LIBSAILFISHAPP_INCLUDE_DIRS - The SailfishApp include directories
#  LIBSAILFISHAPP_LIBRARIES - The libraries needed to use SailfishApp
#  LIBSAILFISHAPP_DEFINITIONS - Compiler switches required for using SailfishApp

find_package(PkgConfig)
pkg_check_modules(LIBSAILFISHAPP QUIET sailfishapp)

get_cmake_property(_variableNames VARIABLES)
foreach (_variableName ${_variableNames})
    message(STATUS "${_variableName}=${${_variableName}}")
endforeach()
