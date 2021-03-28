#!/usr/bin/env bash

set -exo pipefail

sudo yum install -y python3 pip3
sudo pip3 install jupyter
sudo pip3 install flask
