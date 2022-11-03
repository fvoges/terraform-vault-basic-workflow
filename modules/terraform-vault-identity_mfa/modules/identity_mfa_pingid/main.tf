locals {
  namespace       = var.namespace
  settings_file   = var.settings_file
  username_format = var.username_format
}

resource "vault_identity_mfa_pingid" "default" {
  namespace            = local.namespace
  settings_file_base64 = local.settings_file
  username_format      = local.username_format
}
