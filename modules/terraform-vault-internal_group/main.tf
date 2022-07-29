locals {
  group_name = replace(lower(var.group_name), "/\\W/", "_")
}

resource "vault_identity_group" "internal" {
  name                       = var.group_name
  type                       = "internal"
  external_member_entity_ids = false
  metadata                   = var.group_metadata
  member_group_ids           = var.member_group_ids
  policies                   = var.vault_policies
}

// resource "vault_policy" "internal_group" {
//   name   = "${local.group_name}-group-policy"
//   policy = var.vault_policy_document
//   count  = var.vault_policy_document != null ? 1 : 0
// }
