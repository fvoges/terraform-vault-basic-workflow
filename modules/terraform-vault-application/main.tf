locals {
  prefix                    = var.prefix
  grp                       = var.grp
  app                       = var.app
  appname                   = format("%s-%s-%s", local.prefix, local.grp, local.app)
  parent_namespace          = var.parent_namespace
  app_namespace             = format("%s/%s-%s", local.parent_namespace, local.prefix, local.grp)
  app_group_membership      = var.app_group_membership
  shared_group_namespace    = var.shared_group_namespace != null ? format("%s/%s", local.parent_namespace, var.shared_group_namespace) : null
  shared_group_membership   = var.shared_group_membership
  cert                      = var.tls_role_ca_cert
  create_app_kv_secret      = var.create_app_kv_secret ? "1" : "0"
  create_app_transit_secret = var.create_app_transit_secret ? "1" : "0"
  auth_type                 = var.auth_type
  auth_namespace            = var.shared_group_namespace == null ? local.app_namespace : local.parent_namespace
}

module "approle_role" {
  source    = "../terraform-vault-approle_auth/modules/approle_role"
  count     = local.auth_type == "approle" ? "1" : "0"
  prefix    = local.prefix
  grp       = local.grp
  app       = local.app
  namespace = local.auth_namespace
}

module "tls_role" {
  source    = "../terraform-vault-tls_auth/modules/tls_role"
  count     = local.auth_type == "tls" ? "1" : "0"
  grp       = local.grp
  prefix    = local.prefix
  app       = local.app
  cert      = local.cert
  namespace = local.auth_namespace
}

module "group_membership" {
  for_each        = local.app_group_membership
  source          = "../terraform-vault-app_entity/modules/entity_group_membership"
  entity_name     = local.appname
  group_name      = each.value
  namespace       = local.auth_namespace
  group_namespace = local.app_namespace
  depends_on = [
    module.approle_role,
    module.tls_role,
  ]
}

module "shared_group_membership" {
  for_each        = local.shared_group_membership
  source          = "../terraform-vault-app_entity/modules/entity_group_membership"
  entity_name     = local.appname
  group_name      = each.value
  namespace       = local.auth_namespace
  group_namespace = local.shared_group_namespace
  depends_on = [
    module.approle_role,
    module.tls_role,
  ]
}

resource "vault_generic_secret" "key" {
  count = local.create_app_kv_secret
  path  = "kv/${local.appname}"
  # we're only creating the secret, not managing it
  disable_read = true
  data_json    = jsonencode({ dummy_secret = "" })
  namespace    = local.app_namespace
}

resource "vault_transit_secret_backend_key" "key" {
  count     = local.create_app_transit_secret
  backend   = "transit"
  name      = local.appname
  namespace = local.app_namespace
}
