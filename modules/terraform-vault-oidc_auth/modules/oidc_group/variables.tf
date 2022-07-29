variable "oidc_auth_mount_accessor" {
  type        = string
  description = "OIDC auth backend accessor from `vault_jwt_auth_backend` resource"
}
variable "oidc_group_metadata" {
  type        = map(any)
  description = "Optional map of metadata to assign to the group"
  default     = {}
}
variable "oidc_group_name" {
  type        = string
  description = "Name of the external OIDC group (usually, it matches the name used in the external directory)"
}
variable "oidc_group_alias_name" {
  type        = string
  description = "The identifier of the external OIDC group (normally, the group object ID)"
}
