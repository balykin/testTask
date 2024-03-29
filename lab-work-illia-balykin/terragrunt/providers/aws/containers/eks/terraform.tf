terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.66.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.6.1"
    }
  }
  required_version = "1.1.9"
  # Will be filled by Terragrunt
  backend "s3" {}
}
