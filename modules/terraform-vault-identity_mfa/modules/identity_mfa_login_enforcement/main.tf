locals {
  auth_method_accessors = var.auth_method_accessors
  enforcement_name      = var.name
  mfa_method_ids        = var.mfa_method_ids
  namespace             = var.namespace
}

resource "vault_identity_mfa_login_enforcement" "default" {
  namespace             = local.namespace
  name                  = local.enforcement_name
  mfa_method_ids        = local.mfa_method_ids
  auth_method_accessors = local.auth_method_accessors
}


