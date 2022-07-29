variable "namespace" {
  type        = string
  description = "Namespace to operate in"
  default     = null
}

variable "entity_name" {
  type        = string
  description = "Entity name to add to group"
}

variable "group_name" {
  type        = string
  description = "Group name to add entity to"
}

variable "group_namespace" {
  type        = string
  description = "Group namespace if different than the entity (this needs to be a child of the entity namespace)"
  default     = null
}


