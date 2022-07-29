variable "namespace" {
  type        = string
  description = "Namespace to operate in"
  default     = null
}

variable "accessor" {
  type        = string
  description = "Auth backend mount accessor for the identity alias"
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
  description = "Application/service name"
}

variable "alias_name" {
  type        = string
  description = "Entity alias name override (default is `$prefix-$grp-$app`)"
  default     = null
}
