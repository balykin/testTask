terraform {
  before_hook "before_hook" {
    commands = ["plan", "apply",]
    execute  = [
      "bash",
      "-c",
      "tflint --init --config $(git rev-parse --show-toplevel)/.tflint.hcl && tflint --config $(git rev-parse --show-toplevel)/.tflint.hcl"
    ]
  }
}

locals {
  aws_region     = "us-west-1"
  aws_account_id = "617686195573"
  env            = "illia-lab-env"
}

remote_state {
  backend = "s3"
  config = {
    bucket = "${local.env}-${local.aws_account_id}-terraform-state"
    s3_bucket_tags = {
      Terrgrunt = "True"
      Owner     = "IlliaB"
      Env       = local.env
    }
    key            = "${local.aws_region}/${path_relative_to_include()}/terraform.tfstate"
    encrypt        = true
    kms_key_id     = "arn:aws:kms:${local.aws_region}:${local.aws_account_id}:alias/terraform-${local.env}"
    dynamodb_table = "terraform-${local.env}-lock-state"
    region         = local.aws_region
    dynamodb_table_tags = {
      Terrgrunt = "True"
      Owner     = "IlliaB"
      Env       = local.env
    }
  }
}

inputs = {
  aws_region             = local.aws_region
  env                    = local.env
  allowed_aws_account_id = local.aws_account_id
  default_provider_tags = {
    Env          = local.env
    Terraform    = "True"
  }
  terraform_remote_state_s3_bucket      = "${local.env}-${local.aws_account_id}-terraform-state"
  terraform_remote_state_dynamodb_table = "terraform-lock-state"
  terraform_remote_state_file_name      = "terraform.tfstate"
}
