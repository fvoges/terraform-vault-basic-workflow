locals {
  prefix                    = var.prefix
  grp                       = var.grp
  role                      = var.role
  parent_namespace          = var.parent_namespace
  app_group_membership      = var.app_group_membership
  shared_group_namespace    = var.shared_group_namespace
  shared_group_membership   = var.shared_group_membership
  create_app_kv_secret      = var.create_app_kv_secret
  create_app_transit_secret = var.create_app_transit_secret
  auth_type                 = var.auth_type
  tls_role_ca_cert          = var.tls_role_ca_cert
}

module "application" {
  source                    = "../../modules/terraform-vault-application"
  prefix                    = var.prefix
  grp                       = var.grp
  role                      = var.role
  parent_namespace          = var.parent_namespace
  app_group_membership      = var.app_group_membership
  shared_group_namespace    = var.shared_group_namespace
  shared_group_membership   = var.shared_group_membership
  create_app_kv_secret      = var.create_app_kv_secret
  create_app_transit_secret = var.create_app_transit_secret
  auth_type                 = var.auth_type
  tls_role_ca_cert          = var.tls_role_ca_cert
}
