variable "prefix" {
  type        = string
  description = "Application prefix. Normally used for the environment name (e.g., prod, qa, uat, dev, etc.)"
}

variable "grp" {
  type        = string
  description = "Application group name"
}

variable "role" {
  type        = string
  description = "Application/service name"
}

variable "accessor" {
  type        = string
  description = "Auth method mount accessor for the entity alias"
}
