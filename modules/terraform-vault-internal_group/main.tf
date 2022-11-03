locals {
  group_name       = replace(lower(var.group_name), "/\\W/", "_")
  member_group_ids = var.member_group_ids == [] ? null : var.member_group_ids
  namespace        = var.namespace
}

resource "vault_identity_group" "internal" {
  name                       = var.group_name
  namespace                  = local.namespace
  type                       = "internal"
  external_policies          = true
  external_member_entity_ids = true
  external_member_group_ids  = true
  metadata                   = var.group_metadata
}

resource "vault_identity_group_policies" "ns_admins" {
  namespace = local.namespace
  policies  = var.vault_policies
  group_id  = vault_identity_group.internal.id
  exclusive = false
}

resource "vault_identity_group_member_group_ids" "group_members" {
  namespace        = local.namespace
  member_group_ids = local.member_group_ids
  group_id         = vault_identity_group.internal.id
  exclusive        = false
}
