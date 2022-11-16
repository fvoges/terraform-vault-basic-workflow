# output "namespace_path" {
#   value = vault_namespace.default.path
# }

# output "approle_mount_accessor" {
#   value = local.enable_approle_auth ? module.approle_auth[0].accessor : null
# }

# output "tls_mount_accessor" {
#   value = local.enable_tls_auth ? module.tls_auth[0].accessor : null
# }

output "namespace" {
  value = local.namespace
}

output "parent_namespace" {
  value = local.parent_namespace
}
