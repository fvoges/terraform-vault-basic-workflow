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
