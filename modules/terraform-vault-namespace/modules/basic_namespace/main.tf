locals {
  parent_namespace     = var.parent_namespace
  namespace            = var.namespace
  child_namespace_path = var.parent_namespace == local.parent_namespace ? local.namespace : format("%s/%s", local.parent_namespace, local.namespace)
  admin_group_id       = var.admin_group

  enable_approle_auth  = var.enable_approle_auth ? "1" : "0"
  enable_userpass_auth = var.enable_userpass_auth ? "1" : "0"
  enable_ldap_auth     = var.enable_ldap_auth ? "1" : "0"
  enable_oidc_auth     = var.enable_oidc_auth ? "1" : "0"
}
locals {
  vault_policy_ns_admins_values = {
    namespace = local.child_namespace_path
  }
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

resource "vault_policy" "ns_admins" {
  name   = format("%s-ns-admin", replace(local.child_namespace_path, "/", "-"))
  policy = templatefile("${path.module}/templates/org-namespace-admin.hcl", local.vault_policy_ns_admins_values)
}

resource "vault_identity_group_policies" "ns_admins" {
  policies  = [vault_policy.ns_admins.name]
  group_id  = local.admin_group_id
  exclusive = false
}


