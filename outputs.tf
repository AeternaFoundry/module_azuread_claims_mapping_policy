output "claims_mapping_policies_id" {
  description = "Map of id values across all claims_mapping_policies, keyed the same as var.claims_mapping_policies"
  value       = { for k, v in azuread_claims_mapping_policy.claims_mapping_policies : k => v.id if v.id != null && length(v.id) > 0 }
}
output "claims_mapping_policies_definition" {
  description = "Map of definition values across all claims_mapping_policies, keyed the same as var.claims_mapping_policies"
  value       = { for k, v in azuread_claims_mapping_policy.claims_mapping_policies : k => v.definition if v.definition != null && length(v.definition) > 0 }
}
output "claims_mapping_policies_display_name" {
  description = "Map of display_name values across all claims_mapping_policies, keyed the same as var.claims_mapping_policies"
  value       = { for k, v in azuread_claims_mapping_policy.claims_mapping_policies : k => v.display_name if v.display_name != null && length(v.display_name) > 0 }
}

