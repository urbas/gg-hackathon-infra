#!/usr/bin/env bash

set -exo pipefail

sudo yum install -y python3 pip3 docker tmux
sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -aG docker ec2-user

SRC_DIR=$(mktemp -d)
(
  echo "Building extreme startup docker image in $SRC_DIR"
  cd $SRC_DIR
  git clone https://github.com/rchatley/extreme_startup.git
  cd extreme_startup
  docker build -t extreme_startup .
)