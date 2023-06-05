variable "aws_region" {}
variable "terraform_remote_state_s3_bucket" {}
variable "terraform_remote_state_dynamodb_table" {}
variable "terraform_remote_state_file_name" {}
variable "default_provider_tags" {
  type = map(any)
}
