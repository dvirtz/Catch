enable_language(CXX)

file(WRITE ${CMAKE_CURRENT_BINARY_DIR}/get_version.cpp
"#include <iostream>
#include \"${CMAKE_SOURCE_DIR}/include/internal/catch_version.hpp\"

int main() {
	std::cout << Catch::libraryVersion();
}
"
)

try_run(RUN_RESULT COMPILE_RESULT
	${CMAKE_CURRENT_BINARY_DIR} ${CMAKE_CURRENT_BINARY_DIR}/get_version.cpp
	COMPILE_OUTPUT_VARIABLE COMPILE_OUTPUT
	RUN_OUTPUT_VARIABLE CATCH_VERSION
)

if((NOT COMPILE_RESULT) OR (RUN_RESULT STREQUAL "FAILED_TO_RUN"))
	message(FATAL_ERROR "Failed to detect library version.
	Compile output is:
	${COMPILE_OUTPUT}")
endif()