terraform {
  experiments      = [module_variable_optional_attrs]
  required_version = ">=0.15.0"
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = ">=2.0.0"
    }
  }
}