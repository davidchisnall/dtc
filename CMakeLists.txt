cmake_minimum_required(VERSION 3.0)

project(dtc)

include(CheckSymbolExists)
check_symbol_exists(digittoint "ctype.h" HAVE_DIGITTOINT )
if (NOT HAVE_DIGITTOINT)
	add_definitions("-DMISSING_DIGITTOINT")
endif()

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Werror -Wall -Wno-format-y2k -W -Wno-unused-parameter -Wpointer-arith -Wreturn-type -Wcast-qual -Wwrite-strings -Wswitch -Wshadow -Wunused-parameter -Wcast-align -Wchar-subscripts -Wredundant-decls")


set(dtc_CXX_SRCS
	checking.cc
	dtb.cc
	dtc.cc
	fdt.cc
	input_buffer.cc
	string.cc
)
add_executable(dtc ${dtc_CXX_SRCS})


set_property(TARGET dtc PROPERTY CXX_STANDARD 17)
set(ENABLE_TESTS_DEFAULT FALSE)

if(CMAKE_BUILD_TYPE MATCHES Debug)
	set(ENABLE_TESTS_DEFAULT TRUE)
endif()

option(ENABLE_TESTS "Enable the tests" ${ENABLE_TESTS_DEFAULT})

if(ENABLE_TESTS)
	enable_testing()
	add_subdirectory("Tests")
endif()

