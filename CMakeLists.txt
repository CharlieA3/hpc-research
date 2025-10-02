cmake_minimum_required(3.12)
project(profiler)

add_executable(runner main.cpp llm_profiler.cpp)

target_include_directories(runner ${CMAKE_CURRENT_SOURCE_DIR}/include)
