

resource "vault_database_secret_backend_role" "role" {
  backend             = var.mount_path
  name                = var.role_name
  db_name             = var.mount_name
  creation_statements = var.creation_statement
}

data "vault_policy_document" "mongodb_user_policy" {
  rule {
    description  = "Allow creation of dynamic credentials"
    path         = "${var.mount_path}/creds/${var.role_name}"
    capabilities = ["read"]
  }
}

resource "vault_policy" "mongodb_user" {
  name   = "${var.role_name}-user"
  policy = data.vault_policy_document.mongodb_user_policy.hcl
}
