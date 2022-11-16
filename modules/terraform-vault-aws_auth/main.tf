locals {
  namespace = var.namespace
}

resource "vault_auth_backend" "default" {
  type      = "approle"
  namespace = var.namespace
}
