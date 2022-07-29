variable "namespace" {
  type        = string
  description = "Namespace to operate in"
  default     = null
}

variable "name" {
  type        = string
  description = "User name to manage"
}

variable "policies" {
  type        = list(string)
  description = "Array of policy names to assign to the user"
}
