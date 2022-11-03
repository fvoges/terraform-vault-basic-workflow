variable "namespace" {
  type        = string
  description = "Namespace to operate in"
  default     = null
}

variable "auth_method_accessors" {
  type        = list(string)
  description = "Auth backend accessor list to enforce MFA on"
}

variable "name" {
  type        = string
  description = "Login enforcement name"
}

variable "mfa_method_ids" {
  type        = list(string)
  description = "Set of MFA method UUIDs"
}
