variable "namespace" {
  type        = string
  description = "Namespace to operate in"
  default     = null
}

variable "prefix" {
  type        = string
  description = "Application prefix. Normally used for the environment name (e.g., prod, qa, uat, dev, etc.)"
}

variable "grp" {
  type        = string
  description = "Application group name"
}

variable "path_prefix" {
  type        = string
  description = "Path prefix for all the rules."
  default     = null
}
