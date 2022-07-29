resource "vault_mount" "mongodb" {
  path = var.mount_path
  type = "database"
}

resource "vault_database_secret_backend_connection" "mongodb" {
  backend       = vault_mount.mongodb.path
  name          = var.mount_name
  allowed_roles = [var.role_name]

  mongodbatlas {
    public_key  = var.public_key
    private_key = var.private_key
    project_id  = var.project_id
  }
}

// data "vault_policy_document" "mongodb_user_policy" {
//   rule {
//     description  = "Allow creation of dynamic credentials"
//     path         = "${var.mount_path}/creds/{{identity.entity.metadata.env}}"
//     capabilities = ["read"]
//   }
// }

// resource "vault_policy" "mongodb_user" {
//   name   = "mongodb_user_template"
//   policy = data.vault_policy_document.mongodb_user_policy.hcl
// }
