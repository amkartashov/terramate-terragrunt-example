globals "cfg" {
  aws = {
    region = "eu-west-1" # ireland
  }
  default_tags = {
    managed_by = "terragrunt"
  }

  complex_cfg_setting = {
    key1     = "key1valueDefault"
    key2     = "key2valueDefault"
    key3list = ["some", "default", "list"]
    nestedMap = {
      some = "default"
    }
  }
}
