variable "claims_mapping_policies" {
  description = <<EOT
Map of claims_mapping_policies, attributes below
Required:
    - definition
    - display_name
Optional:
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - read (optional)
        - update (optional)
EOT

  type = map(object({
    definition   = list(string)
    display_name = string
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      read   = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.claims_mapping_policies : (
        alltrue([for x in v.definition : length(x) > 0])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.claims_mapping_policies : (
        length(v.display_name) > 0
      )
    ])
    error_message = "must not be empty"
  }
}

