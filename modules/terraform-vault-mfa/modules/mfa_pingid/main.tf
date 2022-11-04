locals {
  namespace       = var.namespace
  settings_file   = var.settings_file
  username_format = var.username_format
  mount_accessor  = var.mount_accessor
  name            = var.name
}

resource "vault_mfa_pingid" "default" {
  namespace            = local.namespace
  name                 = local.name
  settings_file_base64 = local.settings_file
  username_format      = local.username_format
  mount_accessor       = local.mount_accessor
}
