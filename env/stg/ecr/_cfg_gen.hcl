// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT

locals {
  cfg = {
    aws_account_id   = "234567890123"
    aws_account_name = "stg-account"
    aws_region       = "eu-west-1"
    complex_cfg_setting = {
      key1 = "key1valueDefault"
      key2 = "key2valueDefault"
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
      managed_by = "terragrunt"
    }
    environment       = "staging"
    stack_description = "AWS ECR private repositories"
    stack_name        = "ecr"
  }
}
