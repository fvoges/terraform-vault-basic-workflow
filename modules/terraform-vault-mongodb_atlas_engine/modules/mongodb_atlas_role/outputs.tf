output "policy" {
  value = vault_policy.mongodb_user
}
output "policy_document" {
  value = data.vault_policy_document.mongodb_user_policy
}
