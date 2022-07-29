locals {
  namespace = var.namespace
}

resource "vault_auth_backend" "default" {
  type      = "cert"
  namespace = local.namespace
}
