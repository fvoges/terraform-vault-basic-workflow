
locals {
  prefix                      = var.prefix
  grp                         = var.grp
  parent_namespace            = var.parent_namespace
  enable_approle_auth         = var.enable_approle_auth
  enable_tls_auth             = var.enable_tls_auth
  enable_kv_secrets           = var.enable_kv_secrets
  enable_transit_secrets      = var.enable_transit_secrets
  create_group_kv_secret      = var.create_group_kv_secret
  create_group_transit_secret = var.create_group_transit_secret
  create_tpl_policy_groups    = var.create_tpl_policy_groups
}

module "namespace" {
  source = "../../modules/terraform-vault-namespace/modules/app_namespace"

  parent_namespace            = local.parent_namespace
  prefix                      = local.prefix
  grp                         = local.grp
  enable_approle_auth         = local.enable_approle_auth
  enable_tls_auth             = local.enable_tls_auth
  enable_kv_secrets           = local.enable_kv_secrets
  enable_transit_secrets      = local.enable_transit_secrets
  create_group_kv_secret      = local.create_group_kv_secret
  create_group_transit_secret = local.create_group_transit_secret
  create_tpl_policy_groups    = local.create_tpl_policy_groups
}

