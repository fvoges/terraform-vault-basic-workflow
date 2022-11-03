locals {
  namespace     = var.root_namespace == "" ? null : var.root_namespace
  org_namespace = var.org_namespace
}

module "org_namespace" {
  source           = "../../modules/terraform-vault-namespace/modules/basic_namespace"
  namespace        = local.org_namespace
  parent_namespace = local.namespace
  admin_group      = module.vault_admin_group.internal_group.id
}
