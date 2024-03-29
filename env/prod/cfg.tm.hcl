globals "cfg" {
  environment = "production"
}

globals "cfg" "aws" {
  account = {
    name = "prod-account"
    id   = "123456789012"
  }
}

globals "cfg" "default_tags" {
  in_progress = "true"
}
