cmake_minimum_required(VERSION 3.12)
project(profiler)

add_executable(runner src/main.cpp src/llm_profile.cpp)

target_include_directories(runner PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/include)
