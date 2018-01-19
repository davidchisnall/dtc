cmake_minimum_required(VERSION 2.8)

project(dtc)

set(dtc_CXX_SRCS
	checking.cc
	dtb.cc
	dtc.cc
	fdt.cc
	input_buffer.cc
	string.cc
)
add_executable(dtc ${dtc_CXX_SRCS})

set_property(TARGET dtc PROPERTY CXX_STANDARD 11)
set(ENABLE_TESTS_DEFAULT FALSE)

if(CMAKE_BUILD_TYPE MATCHES Debug)
	set(ENABLE_TESTS_DEFAULT TRUE)
endif()

option(ENABLE_TESTS "Enable the tests" ${ENABLE_TESTS_DEFAULT})

if(ENABLE_TESTS)
	enable_testing()
	add_subdirectory("Tests")
endif()

