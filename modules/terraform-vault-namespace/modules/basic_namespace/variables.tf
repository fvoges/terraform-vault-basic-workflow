variable "namespace" {
  type        = string
  description = "The namespace to manage"
  default     = null
}

variable "parent_namespace" {
  type        = string
  description = "The namespace will be created under this namespace"
  default     = ""
}

variable "enable_approle_auth" {
  type        = bool
  description = "Enable AppRole auth method"
  default     = false
}

variable "enable_userpass_auth" {
  type        = bool
  description = "Enable UserPass auth method"
  default     = false
}

variable "enable_oidc_auth" {
  type        = bool
  description = "Enable OIDC auth method"
  default     = false
}

variable "enable_ldap_auth" {
  type        = bool
  description = "Enable LDAP auth method"
  default     = false
}

variable "admin_group" {
  type        = string
  description = "Group ID of the identity group who will administer the namespace"
}
