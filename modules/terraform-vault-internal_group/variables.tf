variable "group_metadata" {
  type        = map(any)
  description = "Metadata to be added to the internal group (key => value pairs)."
  default     = {}
}
variable "group_name" {
  type        = string
  description = "Internal group name."
}
variable "member_group_ids" {
  type        = list(string)
  description = "List of group members."
}
variable "vault_policies" {
  type        = list(any)
  description = "List of Vault ACL policies to attach to the group."
  default     = null
}

variable "allow_external_member_entity_ids" {
  type        = bool
  description = "If set to true, this module will ignore any Entity IDs returned from Vault or specified in the resource."
  default     = false
}
