locals {
  namespace = var.namespace
}

resource "vault_mount" "transit" {
  path      = "transit"
  type      = "transit"
  namespace = local.namespace

  options = {
    convergent_encryption = false
  }
}
