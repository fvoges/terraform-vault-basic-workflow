output "external_group" {
  value       = vault_identity_group.oidc_external
  description = "External group resource (exposes the generated `vault_identity_group` resource)"
}