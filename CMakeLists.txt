cmake_minimum_required(VERSION 3.12)
project(profiler)

add_executable(llm_profiler)

target_sources(llm_profiler PRIVATE
    src/main.cpp
    src/llm_profiler.cpp
)

target_include_directories(llm_profiler PRIVATE
	${CMAKE_CURRENT_SOURCE_DIR}/include
)
