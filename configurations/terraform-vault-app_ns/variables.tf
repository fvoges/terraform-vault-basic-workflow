
variable "parent_namespace" {
  type        = string
  description = "The namespace will be created under this namespace"
  default     = ""
}

variable "prefix" {
  type        = string
  description = "Application prefix. Normally used for the environment name (e.g., prod, qa, uat, dev, etc.)"
}

variable "grp" {
  type        = string
  description = "Application group name"
}

variable "enable_tls_auth" {
  type        = bool
  description = "Enable TLS auth method"
  default     = false
}

variable "enable_approle_auth" {
  type        = bool
  description = "Enable TLS auth method"
  default     = false
}

variable "enable_kv_secrets" {
  type        = bool
  description = "Enable KV secrets engine"
  default     = false
}

variable "enable_transit_secrets" {
  type        = bool
  description = "Enable Transit secrets engine"
  default     = false
}

variable "create_group_kv_secret" {
  type        = bool
  description = "Create group KV secret"
  default     = false
}

variable "create_group_transit_secret" {
  type        = bool
  description = "Create group transit key"
  default     = false
}

variable "create_tpl_policy_groups" {
  type        = bool
  description = "Create templated policy groups for enabled transit engines"
  default     = true
}
