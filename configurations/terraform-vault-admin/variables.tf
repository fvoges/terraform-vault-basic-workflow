variable "root_namespace" {
  type        = string
  description = "Root namespace name ('' or 'admin')."
  default     = ""
  validation {
    condition = anytrue([
      var.root_namespace == "",
      var.root_namespace == "admin",
    ])
    error_message = "Value must be empty for self-hosted Vault, or 'admin' for HCP Vault"
  }
}

variable "org_namespace" {
  type        = string
  description = "Organization-level namespace name. This namespace will contain all the other namespaces for the org"
  default     = "acme"
}

variable "vault_audit_log_enable_filepath" {
  type        = bool
  description = "Enable filepath audit device"
  default     = true
}

variable "vault_audit_log_file_path" {
  type        = string
  description = "Vault audit log file location. The directory must exist and the Vault daemon user must have write permissions to it"
  default     = "/var/log/vault/audit.log"
}

variable "vault_audit_log_raw" {
  type        = bool
  description = "If 'true', logs the security sensitive information without hashing, in the raw format"
  default     = false
}

variable "vault_audit_log_enable_syslog" {
  type        = bool
  description = "Enable syslog audit device"
  default     = true
}

