locals {
  backend_path = "userpass"
  name         = var.name
  namespace    = var.namespace
  policies     = var.policies
}

data "vault_auth_backend" "userpass" {
  path      = local.backend_path
  namespace = local.namespace
}

resource "vault_identity_entity" "user" {
  name      = local.name
  namespace = local.namespace
  policies  = local.policies
}

resource "vault_identity_entity_alias" "user" {
  name           = local.name
  mount_accessor = data.vault_auth_backend.userpass.accessor
  canonical_id   = vault_identity_entity.user.id
  namespace      = local.namespace
}

# HACK: this is dev-only code. Please don't do this outside your local dev machine
resource "vault_generic_endpoint" "user" {
  path                 = "auth/userpass/users/${local.name}"
  ignore_absent_fields = true
  namespace            = local.namespace

  data_json = jsonencode({ password = local.name })
}

