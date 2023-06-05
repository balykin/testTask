terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.10.0"
    }
  }
  required_version = "1.1.9"
  # Will be filled by Terragrunt
  backend "s3" {}
}
