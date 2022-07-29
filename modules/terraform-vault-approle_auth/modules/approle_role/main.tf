locals {
  prefix       = var.prefix
  grp          = var.grp
  app          = var.app
  role_id      = format("%s-%s-%s", local.prefix, local.grp, local.app)
  backend_path = "approle"
  namespace    = var.namespace
}

data "vault_auth_backend" "approle" {
  path      = "approle"
  namespace = local.namespace
}

resource "vault_approle_auth_backend_role" "default" {
  backend   = local.backend_path
  role_name = local.role_id
  role_id   = local.role_id
  namespace = local.namespace
}


module "app_identity" {
  depends_on = [vault_approle_auth_backend_role.default]
  source     = "../../../terraform-vault-app_entity"

  accessor  = data.vault_auth_backend.approle.accessor
  grp       = local.grp
  prefix    = local.prefix
  app       = local.app
  namespace = local.namespace
}
