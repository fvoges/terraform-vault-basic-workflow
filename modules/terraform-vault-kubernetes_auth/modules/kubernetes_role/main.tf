locals {
  grp          = var.grp
  prefix       = var.prefix
  role          = var.role
  role_id      = format("%s-%s-%s", local.prefix, local.grp, local.role)
  accessor     = var.accessor
  backend_path = "approle"
}

resource "vault_kubernetes_auth_backend_role" "default" {
  backend                          = local.backend_path
  role_name                        = local.role_id
  role_id                          = local.role_id # this might not work
  bound_service_account_names      = local.k8s_svc_account
  bound_service_account_namespaces = local.k8s_namespace
  token_ttl                        = 3600
  # audience                         = "vault"
}

module "app_identity" {
  depends_on = [vault_approle_auth_backend_role.default]
  source     = "../../../terraform-vault-app_entity"

  accessor = local.accessor
  grp      = local.grp
  prefix   = local.prefix
  role      = local.role
}


