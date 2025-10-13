#!/bin/bash

cat << 'EOF' > /etc/apt/sources.list
deb [arch=arm64] http://ports.ubuntu.com/ubuntu-ports focal main restricted universe multiverse
deb [arch=arm64] http://ports.ubuntu.com/ubuntu-ports focal-updates main restricted universe multiverse
deb [arch=arm64] http://ports.ubuntu.com/ubuntu-ports focal-security main restricted universe multiverse
deb [arch=arm64] http://ports.ubuntu.com/ubuntu-ports focal-backports main restricted universe multiverse
EOF

apt-get clean
apt-get update

echo "deb https://repo.download.nvidia.com/jetson/common r35.4 main" > /etc/apt/sources.list.d/nvidia-l4t-apt-source.list
echo "deb https://repo.download.nvidia.com/jetson/t234 r35.4 main" >> /etc/apt/sources.list.d/nvidia-l4t-apt-source.list

apt-get install git build-essential cmake curl ca-certificates -y

# To build llama.cpp, you need cmake 3.18
apt-get install wget build-essential pkg-config libssl-dev git -y \
       && wget https://github.com/Kitware/CMake/releases/download/v3.18.6/cmake-3.18.6.tar.gz \
       && tar -zxvf cmake-3.18.6.tar.gz \
       && cd cmake-3.18.6 \
       && ./bootstrap && make -j$(nproc) && make install \
       && cd .. && rm -rf cmake-3.18.6 cmake-3.18.6.tar.gz


git clone https://github.com/ggml-org/llama.cpp


cd llama.cpp
