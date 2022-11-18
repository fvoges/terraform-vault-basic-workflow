locals {
  prefix       = var.prefix
  grp          = var.grp
  role         = var.role
  role_id      = format("%s-%s-%s", local.prefix, local.grp, local.role)
  backend_path = "approle"
  namespace    = var.namespace
}

data "vault_auth_backend" "approle" {
  path      = "approle"
  namespace = local.namespace
}

resource "vault_approle_auth_backend_role" "default" {
  backend        = local.backend_path
  role_name      = local.role_id
  role_id        = local.role_id
  namespace      = local.namespace
  token_policies = ["default"]
}


module "app_identity" {
  depends_on = [vault_approle_auth_backend_role.default]
  source     = "../../../terraform-vault-app_entity"

  accessor  = data.vault_auth_backend.approle.accessor
  grp       = local.grp
  prefix    = local.prefix
  role      = local.role
  namespace = local.namespace
}
