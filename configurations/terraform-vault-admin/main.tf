locals {
  org_namespace = var.org_namespace
}

resource "vault_namespace" "org" {
  path = local.org_namespace
}
