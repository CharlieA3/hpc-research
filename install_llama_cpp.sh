#!bin/bash

echo "Installing and building llama.cpp"

apt update -y

apt-get install git-all -y

git clone https://github.com/ggml-org/llama.cpp
cd llama.cpp

apt-get install -y software-properties-common
add-apt-repository ppa:kitware/ppa
apt update
apt-get install -y cmake

# for cuda build of llama.cpp
cmake -B build -DGGML_CUDA=ON
cmake --build build --config Release

#NOTE: might need to override the native gpu detection?