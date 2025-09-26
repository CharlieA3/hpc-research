#!bin/bash

CMAKE_VERSION="3.18.3"
CMAKE_URL="https://github.com/Kitware/CMake/releases/download/v${CMAKE_VERSION}/cmake-${CMAKE_VERSION}-Linux-x86_64.tar.gz"

echo "Installing and building llama.cpp"

apt update -y
apt upgrade -y

apt-get install git-all -y

apt-get install software-properties-common -y
# add-apt-repository ppa:kitware/ppa
apt-get install ca-certificates gpg wget curl cmake -y
apt-get upgrade cmake -y

# wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | gpg --dearmor - | tee /usr/share/keyrings/kitware-archive-keyring.gpg >/dev/null
# echo 'deb [signed-by=/usr/share/keyrings/kitware-archive-keyring.gpg] https://apt.kitware.com/ubuntu/ focal main' | tee /etc/apt/sources.list.d/kitware.list
# apt-get update

git clone https://github.com/ggml-org/llama.cpp
cd llama.cpp

# for cuda build of llama.cpp
cmake -B build -DGGML_CUDA=ON -DLLAMA_CURL=OFF
cmake --build build --config Release

#NOTE: might need to override the native gpu detection?