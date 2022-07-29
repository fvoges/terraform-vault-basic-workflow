locals {
  enable_filepath = var.vault_audit_log_enable_filepath ? "1" : "0"
  enable_syslog   = var.vault_audit_log_enable_syslog ? "1" : "0"
  log_file_path   = var.vault_audit_log_file_path
  log_raw         = var.vault_audit_log_raw
}

resource "vault_audit" "file" {
  count = local.enable_filepath
  type  = "file"
  options = {
    file_path = local.log_file_path
    log_raw   = local.log_raw
  }
}

resource "vault_audit" "syslog" {
  count   = local.enable_syslog
  type    = "syslog"
  options = {}
}
