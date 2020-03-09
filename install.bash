#!/bin/bash

set -e

apt-get update -y
apt-get dist-upgrade -y

apt-get install curl gcc g++ git make ninja-build libclang-dev -y

curl -L https://github.com/Kitware/CMake/releases/download/v3.17.0-rc2/cmake-3.17.0-rc2-Linux-x86_64.sh -o cm.sh
bash cm.sh --skip-license --exclude-subdir --prefix=/usr/

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --default-toolchain none --profile minimal -y

source /root/.cargo/env

rustup toolchain install nightly-2020-02-05

rustup component add --toolchain nightly-2020-02-05 rustfmt clippy

cargo install cargo-deny cargo-tarpaulin
