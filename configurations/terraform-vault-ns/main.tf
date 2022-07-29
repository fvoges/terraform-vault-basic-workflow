locals {
  namespace            = var.namespace
  parent_namespace     = var.parent_namespace
  enable_approle_auth  = var.enable_approle_auth
  enable_userpass_auth = var.enable_userpass_auth
}

module "namespace" {
  source               = "../../modules/terraform-vault-namespace/modules/basic_namespace"
  namespace            = local.namespace
  parent_namespace     = local.parent_namespace
  enable_approle_auth  = local.enable_approle_auth
  enable_userpass_auth = local.enable_userpass_auth
}
