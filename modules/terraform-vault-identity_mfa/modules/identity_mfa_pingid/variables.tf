variable "namespace" {
  type        = string
  description = "Namespace to operate in"
  default     = null
}

variable "mount_accessor" {
  type        = string
  description = "Auth backend accessor"
  default     = null
}

variable "settings_file" {
  type        = string
  description = "PingID base64 encoded configuration file"
}

variable "username_format" {
  type        = string
  description = "A template string for mapping Identity names to MFA methods"
  default     = null
}

