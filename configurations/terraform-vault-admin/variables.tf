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

variable "oidc_auth_enable" {
  type        = bool
  description = "Enable OIDC auth for root namespace"
  default     = false
}

variable "oidc_client_id" {
  type        = string
  description = "OIDC client ID"
  default     = null
}
variable "oidc_client_secret" {
  type        = string
  description = "OIDC Client secret."
  sensitive   = true
  default     = null
}
variable "oidc_description" {
  type        = string
  description = "Description for the OIDC Auth backend."
  default     = "OIDC external directory"
}
variable "oidc_discovery_url" {
  type        = string
  description = "Discovery URL for the OIDC Auth backend (see Vault's documentation)."
  default     = null
}

variable "oidc_admin_group_oid" {
  type        = string
  description = "OID for the Vault admins OIDC group."
  default     = null
}
variable "oidc_admin_group_name" {
  type        = string
  description = "Name for the Vault admins OIDC external group."
  default     = null
}
variable "vault_hostname" {
  type        = string
  description = "DNS name of the Vault cluster. Used for the OIDC call-back url."
  default     = null
}

variable "mfa_settings_file" {
  type = string
  description = "PingID MFA settings file"
  sensitive = true
}
variable "mfa_username_format" {
  type = string
  description = "PingID MFA username format"
  default = null
}
variable "mfa_enforcement_name" {
  type = string
  description = "MFA login enforcement name"
  default = "pingid_oidc_auth"
}
