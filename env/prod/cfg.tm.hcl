globals "cfg" {
  environment = "production"
  aws_account_name = "prod-account"
  aws_account_id = "123456789012"
}

globals "cfg" "default_tags" {
  in_progress = "true"
}
