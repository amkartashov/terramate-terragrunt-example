# terramate-terragrunt-example

*Example of terragrunt stacks with nested configuration generated with terramate*.

Terragrunt stacks are organized under `env/` directory:

```
env
├── prod
│  ├── ecr
│  │  ├── _cfg_gen.hcl
│  │  ├── cfg.tm.hcl
│  │  ├── stack.tm.hcl
│  │  └── terragrunt.hcl
...
│  └── cfg.tm.hcl
├── stg
...
├── cfg.tm.hcl
└── root.hcl
```

Nested configuration is kept in `cfg.tm.hcl` files and natively merged by terramate. Terramate generates `_cfg_gen.hcl` for each terragrunt stack and terragrunt loads configuration from it.

Terragrunt code in `env/root.hcl` is responsible for reading `_cfg_gen.hcl` and also runs `terramate` in `before_hook` to detect and avoid situations when configuration is changed but code generation wasn't done.

File `env/root.hcl` should be *include*d into each `terragrunt.hcl` file with this code:

```hcl
include "root" {
  path   = find_in_parent_folders("root.hcl")
  expose = true
}

locals {
  cfg = include.root.locals.cfg
}
```

## Demo

```
$ export TERRAGRUNT_NON_INTERACTIVE=true
$ terragrunt run-all init >/dev/null 2>&1
$ terragrunt run-all apply -auto-approve >/dev/null 2>&1
$ terragrunt --terragrunt-parallelism 1 run-all output 2>/dev/null
====== staging/ecs/cluster
tg_cfg = {
  "aws" = {
    "account" = {
      "id" = "234567890123"
      "name" = "stg-account"
    }
    "region" = "eu-west-1"
  }
  "complex_cfg_setting" = {
    "key1" = "key1valueDefault"
    "key2" = "key2valueDefault"
    "key3list" = [
      "some",
      "default",
      "list",
    ]
    "nestedMap" = {
      "some" = "default"
    }
  }
  "default_tags" = {
    "managed_by" = "terragrunt"
  }
  "environment" = "staging"
  "stack_description" = "AWS ECS cluster"
  "stack_name" = "ecs/cluster"
}
====== production/ecs/cluster
tg_cfg = {
  "aws" = {
    "account" = {
      "id" = "123456789012"
      "name" = "prod-account"
    }
    "region" = "eu-west-1"
  }
  "complex_cfg_setting" = {
    "key1" = "key1valueDefault"
    "key2" = "key2valueDefault"
    "key3list" = [
      "some",
      "default",
      "list",
    ]
    "nestedMap" = {
      "some" = "default"
    }
  }
  "default_tags" = {
    "in_progress" = "true"
    "managed_by" = "terragrunt"
  }
  "environment" = "production"
  "stack_description" = "AWS ECS cluster"
  "stack_name" = "ecs/cluster"
}
====== staging/ecs/tasks
tg_cfg = {
  "aws" = {
    "account" = {
      "id" = "234567890123"
      "name" = "stg-account"
    }
    "region" = "eu-west-1"
  }
  "complex_cfg_setting" = {
    "key1" = "key1valueDefault"
    "key2" = "key2valueDefault"
    "key3list" = [
      "some",
      "default",
      "list",
    ]
    "nestedMap" = {
      "some" = "default"
    }
  }
  "default_tags" = {
    "managed_by" = "terragrunt"
  }
  "environment" = "staging"
  "stack_description" = "AWS ECS cluster tasks"
  "stack_name" = "ecs/tasks"
}
====== staging/network
tg_cfg = {
  "aws" = {
    "account" = {
      "id" = "234567890123"
      "name" = "stg-account"
    }
    "region" = "eu-west-1"
  }
  "complex_cfg_setting" = {
    "key1" = "key1valueDefault"
    "key2" = "key2valueDefault"
    "key3list" = [
      "some",
      "default",
      "list",
    ]
    "nestedMap" = {
      "some" = "default"
    }
  }
  "default_tags" = {
    "managed_by" = "terragrunt"
  }
  "environment" = "staging"
  "stack_description" = "AWS VPC and subnets"
  "stack_name" = "network"
}
====== production/ecr
tg_cfg = {
  "aws" = {
    "account" = {
      "id" = "123456789012"
      "name" = "prod-account"
    }
    "region" = "eu-west-1"
  }
  "complex_cfg_setting" = {
    "key1" = "key1valueDefault"
    "key2" = "no"
    "key3list" = [
      "some",
      "default",
      "list",
    ]
    "nestedMap" = {
      "some" = "default"
    }
  }
  "default_tags" = {
    "in_progress" = "true"
    "managed_by" = "terragrunt"
  }
  "environment" = "production"
  "stack_description" = "AWS ECR private repositories"
  "stack_name" = "ecr"
}
====== production/network
tg_cfg = {
  "aws" = {
    "account" = {
      "id" = "123456789012"
      "name" = "prod-account"
    }
    "region" = "eu-west-1"
  }
  "complex_cfg_setting" = {
    "key1" = "key1valueDefault"
    "key2" = "key2valueDefault"
    "key3list" = [
      "some",
      "default",
      "list",
    ]
    "nestedMap" = {
      "some" = "default"
    }
  }
  "default_tags" = {
    "in_progress" = "true"
    "managed_by" = "terragrunt"
  }
  "environment" = "production"
  "stack_description" = "AWS VPC and subnets"
  "stack_name" = "network"
}
====== production/ecs/tasks
tg_cfg = {
  "aws" = {
    "account" = {
      "id" = "123456789012"
      "name" = "prod-account"
    }
    "region" = "eu-west-1"
  }
  "complex_cfg_setting" = {
    "key1" = "key1valueDefault"
    "key2" = "key2valueDefault"
    "key3list" = [
      "some",
      "default",
      "list",
    ]
    "nestedMap" = {
      "some" = "default"
    }
  }
  "default_tags" = {
    "in_progress" = "true"
    "managed_by" = "terragrunt"
  }
  "environment" = "production"
  "stack_description" = "AWS ECS cluster tasks"
  "stack_name" = "ecs/tasks"
}
====== staging/ecr
tg_cfg = {
  "aws" = {
    "account" = {
      "id" = "234567890123"
      "name" = "stg-account"
    }
    "region" = "eu-west-1"
  }
  "complex_cfg_setting" = {
    "key1" = "key1valueDefault"
    "key2" = "key2valueDefault"
    "key3list" = [
      "some",
      "default",
      "list",
    ]
    "nestedMap" = {
      "some" = "default"
    }
  }
  "default_tags" = {
    "managed_by" = "terragrunt"
  }
  "environment" = "staging"
  "stack_description" = "AWS ECR private repositories"
  "stack_name" = "ecr"
}
```
