# terraform-vault-secrets-mongodb-atlas-mount

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
| [vault_database_secret_backend_connection.mongodb](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/database_secret_backend_connection) | resource |
| [vault_mount.mongodb](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/mount) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_mount_name"></a> [mount\_name](#input\_mount\_name) | MongoDB Atlas secrets engine mount name. | `string` | `"mongodb"` | no |
| <a name="input_mount_path"></a> [mount\_path](#input\_mount\_path) | MongoDB Atlas secrets engine mount path. | `string` | `"mongodb"` | no |
| <a name="input_private_key"></a> [private\_key](#input\_private\_key) | Mongodb Atlas API private key. | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | Mongodb Atlas project ID. | `string` | n/a | yes |
| <a name="input_public_key"></a> [public\_key](#input\_public\_key) | Mongodb Atlas API public key. | `string` | n/a | yes |
| <a name="input_role_name"></a> [role\_name](#input\_role\_name) | Mongodb Atlas role name to create. | `string` | `"mongodb"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vault_database_secret_backend_connection"></a> [vault\_database\_secret\_backend\_connection](#output\_vault\_database\_secret\_backend\_connection) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0, < 2.0.0 |
| <a name="requirement_vault"></a> [vault](#requirement\_vault) | >= 3.10.0, < 4.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_vault"></a> [vault](#provider\_vault) | 3.10.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [vault_database_secret_backend_connection.mongodb](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/database_secret_backend_connection) | resource |
| [vault_mount.mongodb](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/mount) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_mount_name"></a> [mount\_name](#input\_mount\_name) | MongoDB Atlas secrets engine mount name. | `string` | `"mongodb"` | no |
| <a name="input_mount_path"></a> [mount\_path](#input\_mount\_path) | MongoDB Atlas secrets engine mount path. | `string` | `"mongodb"` | no |
| <a name="input_private_key"></a> [private\_key](#input\_private\_key) | Mongodb Atlas API private key. | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | Mongodb Atlas project ID. | `string` | n/a | yes |
| <a name="input_public_key"></a> [public\_key](#input\_public\_key) | Mongodb Atlas API public key. | `string` | n/a | yes |
| <a name="input_role_name"></a> [role\_name](#input\_role\_name) | Mongodb Atlas role name to create. | `string` | `"mongodb"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vault_database_secret_backend_connection"></a> [vault\_database\_secret\_backend\_connection](#output\_vault\_database\_secret\_backend\_connection) | n/a |
<!-- END_TF_DOCS -->