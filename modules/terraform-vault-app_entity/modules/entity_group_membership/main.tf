locals {
  entity_name     = var.entity_name
  group_name      = var.group_name
  namespace       = var.namespace
  group_namespace = var.group_namespace != null ? var.group_namespace : var.namespace
}

data "vault_identity_entity" "entity" {
  entity_name = local.entity_name
  namespace   = local.namespace
}

data "vault_identity_group" "group" {
  group_name = local.group_name
  namespace  = local.group_namespace
}

resource "vault_identity_group_member_entity_ids" "members" {
  group_id          = data.vault_identity_group.group.id
  member_entity_ids = [data.vault_identity_entity.entity.id]
  exclusive         = false
  namespace         = local.group_namespace
}
