output "oidc_auth_mount_accessor" {
  value       = vault_jwt_auth_backend.default.accessor
  description = "OIDC auth mount accessor"
}
