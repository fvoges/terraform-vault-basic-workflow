locals {
  namespace = var.namespace
}

resource "vault_identity_group" "oidc_external" {
  namespace = local.namespace
  name      = var.oidc_group_name
  type      = "external"
  metadata  = var.oidc_group_metadata
}

resource "vault_identity_group_alias" "oidc" {
  namespace      = local.namespace
  name           = var.oidc_group_alias_name
  mount_accessor = var.oidc_auth_mount_accessor
  canonical_id   = vault_identity_group.oidc_external.id
}
