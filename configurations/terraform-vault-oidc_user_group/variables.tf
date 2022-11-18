variable "namespace" {
  type        = string
  description = "Namespace to operate in"
  default     = null
}

variable "oidc_user_group_oid" {
  type        = string
  description = "OID for the Vault users OIDC group."
}
variable "oidc_user_group_name" {
  type        = string
  description = "Name for the Vault users OIDC external group."
}

variable "internal_user_group_name" {
  type = string
  description = "Name on the internal users group"
  default = null
}

variable "user_group_membership" {
  type = set(string)
  description = "List of permission groups"
  default = []
}

variable "user_group_policies" {
  type = list(string)
  description = "List of ACL Policies"
  default = []
}

variable "app_ns_permissions" {
  default = {}
}