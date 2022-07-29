locals {
  prefix    = var.prefix == null ? "" : format("%s/", var.prefix)
  namespace = var.namespace
}

data "vault_policy_document" "kv_app_read" {
  # rule {
  #   path         = "${local.prefix}kv/+"
  #   capabilities = ["list"]
  #   description  = "allow listing of secrets"
  # }

  rule {
    path         = "${local.prefix}kv/{{identity.entity.metadata.prefix}}-{{identity.entity.metadata.grp}}-{{identity.entity.metadata.app}}"
    capabilities = ["read"]
    description  = "allow reading app-specific KV v1 secrets"
  }

  rule {
    path         = "${local.prefix}kv/data/{{identity.entity.metadata.prefix}}-{{identity.entity.metadata.grp}}-{{identity.entity.metadata.app}}"
    capabilities = ["read"]
    description  = "allow reading app-specific KV v2 secrets"
  }

}

resource "vault_policy" "kv_app_read" {
  name      = "templated-kv-app-read"
  policy    = data.vault_policy_document.kv_app_read.hcl
  namespace = local.namespace
}

resource "vault_identity_group" "kv_app_read" {
  name                       = "templated-kv-app-read"
  type                       = "internal"
  policies                   = ["templated-kv-app-read"]
  external_member_entity_ids = true
  namespace                  = local.namespace
}

data "vault_policy_document" "kv_grp_read" {
  # rule {
  #   path         = "${local.prefix}kv/+"
  #   capabilities = ["list"]
  #   description  = "allow listing of secrets"
  # }

  rule {
    path         = "${local.prefix}kv/{{identity.entity.metadata.prefix}}-{{identity.entity.metadata.grp}}"
    capabilities = ["read"]
    description  = "allow reading group KV v1 secrets"
  }

  rule {
    path         = "${local.prefix}kv/data/{{identity.entity.metadata.prefix}}-{{identity.entity.metadata.grp}}"
    capabilities = ["read"]
    description  = "allow reading group KV v2 secrets"
  }
}

resource "vault_policy" "kv_grp_read" {
  name      = "templated-kv-grp-read"
  policy    = data.vault_policy_document.kv_grp_read.hcl
  namespace = local.namespace
}

resource "vault_identity_group" "kv_grp_read" {
  name                       = "templated-kv-grp-read"
  type                       = "internal"
  policies                   = ["templated-kv-grp-read"]
  external_member_entity_ids = true
  namespace                  = local.namespace
}
