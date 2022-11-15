locals {
  namespace   = var.namespace
  accessor    = var.accessor
  prefix      = var.prefix
  grp         = var.grp
  role        = var.role
  entity_name = format("%s-%s-%s", local.prefix, local.grp, local.role)
  alias_name  = var.alias_name == null ? local.entity_name : var.alias_name
}

resource "vault_identity_entity" "default" {
  name = local.entity_name
  metadata = {
    prefix = local.prefix
    grp    = local.grp
    role   = local.role
  }
  namespace = local.namespace
}

resource "vault_identity_entity_alias" "default" {
  name           = local.alias_name
  mount_accessor = local.accessor
  canonical_id   = vault_identity_entity.default.id
  namespace      = local.namespace
}
