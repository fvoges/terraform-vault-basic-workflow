locals {
  namespace                = var.namespace
  oidc_user_group_oid      = var.oidc_user_group_oid
  oidc_user_group_name     = var.oidc_user_group_name
  internal_user_group_name = var.internal_user_group_name == null ? var.oidc_user_group_name : var.internal_user_group_name
  user_group_membership    = var.user_group_membership
  user_group_policies      = var.user_group_policies

  ns_groups = flatten([
    for namespace, groups in var.app_ns_permissions: [
      for group in groups: {
        namespace = namespace
        group = group
      }
    ]
  ])
}

data "vault_auth_backend" "oidc" {
  path      = "oidc"
  namespace = local.namespace
}

module "oidc_user_group" {
  namespace                = local.namespace
  source                   = "../../modules/terraform-vault-oidc_auth/modules/oidc_group"
  oidc_auth_mount_accessor = data.vault_auth_backend.oidc.accessor
  oidc_group_alias_name    = local.oidc_user_group_oid
  oidc_group_name          = local.oidc_user_group_name
}

module "vault_user_group" {
  source         = "../../modules/terraform-vault-internal_group"
  namespace      = local.namespace
  group_name     = local.internal_user_group_name
  vault_policies = local.user_group_policies
}

resource "vault_identity_group_member_group_ids" "oidc_vault_users" {
  namespace        = local.namespace
  member_group_ids = [module.oidc_user_group.external_group.id]
  group_id         = module.vault_user_group.internal_group.id
  exclusive        = false
}

data "vault_identity_group" "policy_group" {
  for_each   = local.user_group_membership
  group_name = each.key
}

resource "vault_identity_group_member_group_ids" "vault_users_ns_permissions" {
  for_each         = data.vault_identity_group.policy_group
  namespace        = local.namespace
  member_group_ids = [module.vault_user_group.internal_group.id]
  group_id         = each.value.id
  exclusive        = false
}

data "vault_identity_group" "ns_secrets_acl_group" {
  for_each = { for entry in local.ns_groups: "${entry.namespace}.${entry.group}" => entry }
  group_name = each.value.group
  namespace = each.value.namespace
}

resource "vault_identity_group_member_group_ids" "vault_users_secrets_permissions" {
  for_each         = data.vault_identity_group.ns_secrets_acl_group
  namespace        = each.value.namespace
  member_group_ids = [module.vault_user_group.internal_group.id]
  group_id         = each.value.id
  exclusive        = false
}
