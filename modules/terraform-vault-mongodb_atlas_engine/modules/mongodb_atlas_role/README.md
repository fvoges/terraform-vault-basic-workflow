# terraform-vault-secrets-mongodb-atlas-role

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0, < 2.0.0 |
| <a name="requirement_vault"></a> [vault](#requirement\_vault) | ~> 2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_vault"></a> [vault](#provider\_vault) | 2.21.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [vault_database_secret_backend_role.role](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/database_secret_backend_role) | resource |
| [vault_policy.mongodb_user](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/policy) | resource |
| [vault_policy_document.mongodb_user_policy](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_creation_statement"></a> [creation\_statement](#input\_creation\_statement) | MongoDB Atlas secrets engine role creation statement. This defines how to create the user and which permissions it has. Provided by your MongoDB admins. | `list(string)` | n/a | yes |
| <a name="input_mount_name"></a> [mount\_name](#input\_mount\_name) | MongoDB Atlas secrets engine mount name. | `string` | `"mongodb"` | no |
| <a name="input_mount_path"></a> [mount\_path](#input\_mount\_path) | MongoDB Atlas secrets engine mount path. | `string` | `"mongodb"` | no |
| <a name="input_role_name"></a> [role\_name](#input\_role\_name) | Mongodb Atlas role name to create. | `string` | `"mongodb"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_policy"></a> [policy](#output\_policy) | n/a |
| <a name="output_policy_document"></a> [policy\_document](#output\_policy\_document) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->