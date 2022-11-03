output "mfa_pingid" {
  value       = vault_identity_mfa_pingid.default
  description = "MFA PingID resource (exposes the generated `vault_identity_mfa_pingid` resource)"
}
