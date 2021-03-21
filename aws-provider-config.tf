provider "aws" {
  region  = "eu-west-1"
  profile = "urbas-admin"
}

terraform {
  backend "s3" {
    bucket  = "tfstate-tmp"
    key     = "gg-hackathon"
    region  = "eu-west-1"
    profile = "urbas-admin"
  }
}
