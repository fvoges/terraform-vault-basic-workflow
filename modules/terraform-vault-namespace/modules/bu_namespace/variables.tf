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

variable "enable_k8s_auth" {
  type        = bool
  description = "Enable K8 auth method"
  default     = false
}

variable "enable_aws_auth" {
  type        = bool
  description = "Enable AWS auth method"
  default     = false
}

variable "enable_azure_auth" {
  type        = bool
  description = "Enable Azure auth method"
  default     = false
}

variable "admin_group" {
  type        = string
  description = "Group ID of the identity group who will administer the namespace"
}
