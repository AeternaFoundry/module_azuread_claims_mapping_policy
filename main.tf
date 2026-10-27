resource "azuread_claims_mapping_policy" "claims_mapping_policies" {
  for_each = var.claims_mapping_policies

  definition   = each.value.definition
  display_name = each.value.display_name

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      read   = timeouts.value.read
      update = timeouts.value.update
    }
  }
}

