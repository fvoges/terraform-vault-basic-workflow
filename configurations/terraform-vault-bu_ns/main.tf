locals {
  namespace            = var.namespace
  parent_namespace     = var.parent_namespace
  enable_approle_auth  = var.enable_approle_auth
  enable_userpass_auth = var.enable_userpass_auth
}

data "vault_identity_group" "vault_admins" {
  group_name = "Vault Admins"
}

module "namespace" {
  source              = "../../modules/terraform-vault-namespace/modules/bu_namespace"
  namespace           = local.namespace
  parent_namespace    = local.parent_namespace
  enable_approle_auth = local.enable_approle_auth
  admin_group         = data.vault_identity_group.vault_admins.id
}
