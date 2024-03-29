terramate {
}

globals {
  cfg = {
    stack_name = terramate.stack.name
    stack_description = terramate.stack.description
  }
}

generate_hcl "_cfg_gen.hcl" {
  content {
    locals {
      cfg = global.cfg
    }
  }
}
