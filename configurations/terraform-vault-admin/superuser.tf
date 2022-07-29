locals {
  name = "root"
}

data "vault_policy_document" "superuser" {
  rule {
    path         = "*"
    capabilities = ["create", "read", "update", "delete", "list", "sudo"]
    description  = "allow full access"
  }
}

resource "vault_policy" "superuser" {
  name   = "superuser"
  policy = data.vault_policy_document.superuser.hcl
}

module "userpass_auth" {
  source = "../../modules/terraform-vault-userpass_auth"
}

module "userpass_user" {
  source   = "../../modules/terraform-vault-userpass_auth/modules/userpass_user"
  name     = "root"
  policies = ["superuser"]
  depends_on = [
    module.userpass_auth,
  ]
}
