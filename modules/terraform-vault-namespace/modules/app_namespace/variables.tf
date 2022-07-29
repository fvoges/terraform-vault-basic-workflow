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
  description = "Enable AppRole auth method"
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
  description = "Create group Transit key"
  default     = false
}

variable "create_tpl_policy_groups" {
  type        = bool
  description = "Create templated policy groups for enabled secret engines"
  default     = true
}

variable "create_shared_policy_groups" {
  type        = bool
  description = "Create shared policy groups for Transit secrets engine"
  default     = true
}

variable "enable_k8s_auth" {
  type        = bool
  description = "Enable Kubernetes auth method"
  default     = false
}

variable "k8s_api_url" {
  type        = string
  description = "Kubernetes API URL"
  default     = null
}

variable "k8s_ca_cert" {
  type        = string
  description = "Kubernetes CA certificate"
  default     = null
}

variable "k8s_token_reviewer_jwt" {
  type        = string
  description = "Kubernetes JWT reviewer token"
  default     = null
}
