locals {
  oidc_enable           = var.oidc_auth_enable ? "1" : "0"
  oidc_client_id        = var.oidc_client_id
  oidc_client_secret    = var.oidc_client_secret
  oidc_description      = var.oidc_description
  oidc_discovery_url    = var.oidc_discovery_url
  vault_hostname        = var.vault_hostname
  oidc_admin_group_oid  = var.oidc_admin_group_oid
  oidc_admin_group_name = var.oidc_admin_group_name
}

module "oidc_auth" {
  count              = local.oidc_enable
  source             = "../../modules/terraform-vault-oidc_auth"
  oidc_client_id     = local.oidc_client_id
  oidc_client_secret = local.oidc_client_secret
  oidc_description   = local.oidc_description
  oidc_discovery_url = local.oidc_discovery_url
  vault_hostname     = local.vault_hostname
}

module "oidc_admin_group" {
  count                    = local.oidc_enable
  source                   = "../../modules/terraform-vault-oidc_auth/modules/oidc_group"
  oidc_auth_mount_accessor = module.oidc_auth[0].oidc_auth_mount_accessor
  oidc_group_alias_name    = local.oidc_admin_group_oid
  oidc_group_name          = local.oidc_admin_group_name
}

resource "vault_identity_group_member_group_ids" "oidc_vault_admins" {
  count            = local.oidc_enable
  member_group_ids = [module.oidc_admin_group[0].external_group.id]
  group_id         = module.vault_admin_group.internal_group.id
  exclusive        = false
}

