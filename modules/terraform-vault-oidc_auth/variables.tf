variable "oidc_client_id" {
  type        = string
  description = "OIDC client ID"
}
variable "oidc_client_secret" {
  type        = string
  description = "OIDC Client secret."
  sensitive   = true
}
variable "oidc_description" {
  type        = string
  description = "Description for the OIDC Auth backend."
  default     = "OIDC external directory"
}
variable "oidc_discovery_url" {
  type        = string
  description = "Discovery URL for the OIDC Auth backend (see Vault's documentation)."
}
variable "vault_hostname" {
  type        = string
  description = "DNS name of the Vault cluster."
}
