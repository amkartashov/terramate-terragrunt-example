// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT

locals {
  cfg = {
    aws_account_id   = "123456789012"
    aws_account_name = "prod-account"
    aws_region       = "eu-west-1"
    complex_cfg_setting = {
      key1 = "key1valueDefault"
      key2 = "no"
      key3list = [
        "some",
        "default",
        "list",
      ]
      nestedMap = {
        some = "default"
      }
    }
    default_tags = {
      in_progress = "true"
      managed_by  = "terragrunt"
    }
    environment       = "production"
    stack_description = "AWS ECR private repositories"
    stack_name        = "ecr"
  }
}
