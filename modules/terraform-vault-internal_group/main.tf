locals {
  group_name = replace(lower(var.group_name), "/\\W/", "_")
}

resource "vault_identity_group" "internal" {
  name                       = var.group_name
  type                       = "internal"
  external_member_entity_ids = var.allow_external_member_entity_ids
  metadata                   = var.group_metadata
  member_group_ids           = var.member_group_ids
  external_policies          = true
}

resource "vault_identity_group_policies" "ns_admins" {
  policies  = var.vault_policies
  group_id  = vault_identity_group.internal.id
  exclusive = false
}
