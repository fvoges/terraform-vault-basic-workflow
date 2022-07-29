variable "namespace" {
  type        = string
  description = "The namespace to manage"
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
