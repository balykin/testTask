terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.20.0"
    }
  }
  required_version = "v0.14.9"
  # Will be filled by Terragrunt
  backend "s3" {}
}
