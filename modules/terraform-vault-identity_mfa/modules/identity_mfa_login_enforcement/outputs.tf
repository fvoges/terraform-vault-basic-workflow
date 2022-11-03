output "login_enforcement" {
  value       = vault_identity_mfa_login_enforcement.default
  description = "Login enforcement resource (exposes the generated `vault_identity_mfa_login_enforcement` resource)"
}
