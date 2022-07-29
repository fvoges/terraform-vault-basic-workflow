locals {
  parent_namespace     = var.parent_namespace
  namespace            = var.namespace
  child_namespace_path = format("%s/%s", local.parent_namespace, local.namespace)

  enable_approle_auth  = var.enable_approle_auth ? "1" : "0"
  enable_userpass_auth = var.enable_userpass_auth ? "1" : "0"
}

resource "vault_namespace" "default" {
  path      = local.namespace
  namespace = local.parent_namespace
}

module "approle_auth" {
  source     = "../../../terraform-vault-approle_auth"
  count      = local.enable_approle_auth
  namespace  = local.child_namespace_path
  depends_on = [vault_namespace.default]
}

module "userpass_auth" {
  source     = "../../../terraform-vault-userpass_auth"
  count      = local.enable_userpass_auth
  namespace  = local.child_namespace_path
  depends_on = [vault_namespace.default]
}

