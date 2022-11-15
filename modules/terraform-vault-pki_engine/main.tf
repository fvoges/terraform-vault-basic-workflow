locals {
  namespace = var.namespace
}

resource "vault_mount" "kv" {
  type      = "kv"
  path      = "kv"
  namespace = local.namespace
}
