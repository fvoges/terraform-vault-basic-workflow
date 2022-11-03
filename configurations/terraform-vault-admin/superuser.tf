locals {
  name = "root"
}

data "vault_policy_document" "superuser" {
  rule {
    path         = "*"
    capabilities = ["create", "delete", "list", "patch", "read", "sudo", "update"]
    description  = "Allow full access to everything (equivalent to root token permissions)"
  }
}

resource "vault_policy" "superuser" {
  name      = "superuser"
  namespace = local.namespace
  policy    = data.vault_policy_document.superuser.hcl
}

module "userpass_auth" {
  source    = "../../modules/terraform-vault-userpass_auth"
  namespace = local.namespace
}

module "super_user" {
  source    = "../../modules/terraform-vault-userpass_auth/modules/userpass_user"
  namespace = local.namespace
  name      = "root"
  policies  = ["superuser"]
  depends_on = [
    module.userpass_auth,
  ]
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
