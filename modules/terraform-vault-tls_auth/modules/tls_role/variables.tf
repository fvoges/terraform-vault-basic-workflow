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

variable "app" {
  type        = string
  description = "Application/service name"
}

variable "cert" {
  type        = string
  description = "CA or self-signed certificate for the client"
}