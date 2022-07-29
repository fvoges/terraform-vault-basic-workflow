variable "namespace" {
  type        = string
  description = "Namespace to operate in"
  default     = null
}

variable "prefix" {
  type        = string
  description = "Path prefix for all the rules."
  default     = null
}
