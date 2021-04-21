variable "filename" {
  description = "Filename"
  default     = "kubeconfig"
  type        = string
}
variable "colors" {
  description = "Colors"
  default     = true
  type        = bool
}

variable "current_context" {
  description = "Context name"
  default     = ""
  type        = string
}

variable "contexts" {
  description = "List of context configurations"
  type = set(object({
    name         = optional(string)
    cluster_name = optional(string)
    namespace    = optional(string)
    user         = optional(string)
  }))
}

variable "clusters" {
  description = "List of cluster configurations"
  type = set(object({
    name                       = optional(string)
    server                     = optional(string)
    certificate_authority      = optional(string)
    certificate_authority_data = optional(string)
    insecure_skip_tls_verify   = optional(bool)
  }))
}

variable "users" {
  description = "List of user configurations"
  type = set(object({
    name                    = optional(string)
    username                = optional(string)
    password                = optional(string)
    token                   = optional(string)
    client_certificate      = optional(string)
    client_key              = optional(string)
    client_certificate_data = optional(string)
    client_key_data         = optional(string)
  }))
}
