variable "claims_mapping_policies" {
  description = <<EOT
Map of claims_mapping_policies, attributes below
Required:
    - definition
    - display_name
EOT

  type = map(object({
    definition   = list(string)
    display_name = string
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

