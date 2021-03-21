locals {
  install_deps = [
    "sudo yum install -y python3 pip3 docker",
    "sudo systemctl enable docker",
    "sudo systemctl start docker",
  ]
}