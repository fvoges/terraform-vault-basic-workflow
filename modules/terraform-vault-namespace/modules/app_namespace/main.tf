locals {
  prefix                              = var.prefix
  grp                                 = var.grp
  parent_namespace                    = var.parent_namespace
  namespace                           = format("%s-%s", local.prefix, local.grp)
  child_namespace_path                = format("%s/%s", local.parent_namespace, local.namespace)
  admin_group_id                      = var.admin_group
  enable_approle_auth                 = var.enable_approle_auth ? "1" : "0"
  enable_tls_auth                     = var.enable_tls_auth ? "1" : "0"
  enable_transit_secrets              = var.enable_transit_secrets ? "1" : "0"
  enable_kv_secrets                   = var.enable_kv_secrets ? "1" : "0"
  create_group_kv_secret              = var.create_group_kv_secret ? "1" : "0"
  create_group_transit_secret         = var.create_group_transit_secret ? "1" : "0"
  create_tpl_kv_policy_groups         = var.create_group_kv_secret && var.create_tpl_policy_groups ? "1" : "0"
  create_tpl_transit_policy_groups    = var.create_group_transit_secret && var.create_tpl_policy_groups ? "1" : "0"
  create_shared_transit_policy_groups = var.create_group_transit_secret && var.create_shared_policy_groups ? "1" : "0"
}

locals {
  vault_policy_ns_admins_values = {
    namespace = local.child_namespace_path
  }
}

resource "vault_namespace" "default" {
  path      = local.namespace
  namespace = local.parent_namespace
}

resource "vault_policy" "ns_admins" {
  name   = format("%s-ns-admin", replace(local.child_namespace_path, "/", "-"))
  policy = templatefile("${path.module}/templates/app-namespace-admin.hcl", local.vault_policy_ns_admins_values)
}

resource "vault_identity_group_policies" "ns_admins" {
  policies   = [vault_policy.ns_admins.name]
  group_id   = local.admin_group_id
  exclusive  = false
  depends_on = [vault_namespace.default]
}

module "approle_auth" {
  source     = "../../../terraform-vault-approle_auth"
  count      = local.enable_approle_auth
  namespace  = local.child_namespace_path
  depends_on = [vault_identity_group_policies.ns_admins]
}

module "tls_auth" {
  source     = "../../../terraform-vault-tls_auth"
  count      = local.enable_tls_auth
  namespace  = local.child_namespace_path
  depends_on = [vault_identity_group_policies.ns_admins]
}

## KV Secrets Engine configuration
module "kv_engine" {
  source     = "../../../terraform-vault-kv_engine"
  count      = local.enable_kv_secrets
  namespace  = local.child_namespace_path
  depends_on = [module.approle_auth]
}

module "kv_engine_tpl_groups" {
  source     = "../../../terraform-vault-kv_engine/modules/kv_engine_tpl_groups"
  count      = local.create_tpl_kv_policy_groups
  namespace  = local.child_namespace_path
  depends_on = [module.approle_auth]
}

resource "vault_generic_secret" "key" {
  count        = local.create_group_kv_secret
  path         = "${module.kv_engine[0].path}/${local.namespace}"
  disable_read = true # we're only creating the secret, not managing it
  data_json    = jsonencode({ dummy_secret = "" })
  namespace    = local.child_namespace_path
}

## Transit Secrets Engine configuration
module "transit_engine" {
  source     = "../../../terraform-vault-transit_engine"
  count      = local.enable_transit_secrets
  namespace  = local.child_namespace_path
  depends_on = [module.approle_auth]
}

module "transit_engine_tpl_groups" {
  source     = "../../../terraform-vault-transit_engine/modules/transit_engine_tpl_groups"
  count      = local.create_tpl_transit_policy_groups
  namespace  = local.child_namespace_path
  depends_on = [module.approle_auth]
}

module "transit_engine_shared_groups" {
  source     = "../../../terraform-vault-transit_engine/modules/transit_engine_shared_groups"
  count      = local.create_shared_transit_policy_groups
  prefix     = local.prefix
  grp        = local.grp
  namespace  = local.child_namespace_path
  depends_on = [module.approle_auth]
}

resource "vault_transit_secret_backend_key" "key" {
  count     = local.create_group_transit_secret
  backend   = module.transit_engine[0].path
  name      = local.namespace
  namespace = local.child_namespace_path
}
