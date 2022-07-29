output "namespace_path" {
  value = vault_namespace.default.path
}

output "approle_mount_accessor" {
  value = local.enable_approle_auth ? module.approle_auth[0].accessor : null
}

