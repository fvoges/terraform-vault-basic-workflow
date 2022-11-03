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
