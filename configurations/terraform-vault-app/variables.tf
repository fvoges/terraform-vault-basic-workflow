
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

variable "app" {
  type        = string
  description = "Application name"
}

variable "auth_type" {
  type        = string
  description = "App authentication type"

  validation {
    condition     = var.auth_type == "approle" || var.auth_type == "tls"
    error_message = "The authentication must be 'approle', or 'tls'."
  }
}

variable "tls_role_ca_cert" {
  type        = string
  description = "CA certificate for TLS roles"
  default     = ""
}

variable "app_group_membership" {
  type        = set(string)
  description = "Application groups this application is a member of"
  default     = []
}

variable "create_app_kv_secret" {
  type        = bool
  description = "Create app KV secret"
  default     = false
}

variable "create_app_transit_secret" {
  type        = bool
  description = "Create app transit key"
  default     = false
}

variable "shared_group_namespace" {
  type        = string
  description = "Namespace for the  groups, if different from the application auth namespace"
  default     = null
}

variable "shared_group_membership" {
  type        = set(string)
  description = "Application groups this application is a member of"
  default     = []
}
