locals {
  vault_policy_vault_admins_values = {}
}

resource "vault_policy" "vault_admins" {
  name      = "vault-admin"
  namespace = local.namespace
  policy    = templatefile("${path.module}/templates/vault-admin.hcl", local.vault_policy_vault_admins_values)
}

module "vault_admin_group" {
  source         = "../../modules/terraform-vault-internal_group"
  namespace      = local.namespace
  group_name     = "Vault Admins"
  vault_policies = [vault_policy.vault_admins.name]
}

module "admin_user" {
  source    = "../../modules/terraform-vault-userpass_auth/modules/userpass_user"
  namespace = local.namespace
  name      = "admin"
  policies  = []
  depends_on = [
    module.userpass_auth,
  ]
}

data "vault_identity_entity" "admin_user" {
  entity_name = "admin"
  depends_on = [
    module.admin_user,
  ]
}

resource "vault_identity_group_member_entity_ids" "others" {
  namespace         = local.namespace
  member_entity_ids = [data.vault_identity_entity.admin_user.id]
  exclusive         = false
  group_id          = module.vault_admin_group.internal_group.id
}
