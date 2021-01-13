terraform {
  backend "s3" {
    bucket         = "you_bucket"
    key            = "terraform.tfstate"
    region         = "ap-southeast-1"
    encrypt        = true
    dynamodb_table = "lock_of_terraform"
  }
}

provider "aws" {
  region  = "ap-southeast-1"
  version = "2.66"
  ignore_tags {
    key_prefixes = ["kubernetes.io/"]
  }
}