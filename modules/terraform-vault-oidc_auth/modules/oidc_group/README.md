# terraform-vault-auth-oidc-group

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
| [vault_identity_group.oidc_external](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/identity_group) | resource |
| [vault_identity_group_alias.oidc](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/identity_group_alias) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_oidc_auth_mount_accessor"></a> [oidc\_auth\_mount\_accessor](#input\_oidc\_auth\_mount\_accessor) | OIDC auth backend accessor from `vault_jwt_auth_backend` resource | `string` | n/a | yes |
| <a name="input_oidc_group_alias_name"></a> [oidc\_group\_alias\_name](#input\_oidc\_group\_alias\_name) | The identifier of the external OIDC group (normally, the group object ID) | `string` | n/a | yes |
| <a name="input_oidc_group_metadata"></a> [oidc\_group\_metadata](#input\_oidc\_group\_metadata) | Optional map of metadata to assign to the group | `map(any)` | `{}` | no |
| <a name="input_oidc_group_name"></a> [oidc\_group\_name](#input\_oidc\_group\_name) | Name of the external OIDC group (usually, it matches the name used in the external directory) | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_external_group"></a> [external\_group](#output\_external\_group) | External group resource (exposes the generated `vault_identity_group` resource) |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0, < 2.0.0 |
| <a name="requirement_vault"></a> [vault](#requirement\_vault) | >= 3.7.0, < 4.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_vault"></a> [vault](#provider\_vault) | 2.21.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [vault_identity_group.oidc_external](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/identity_group) | resource |
| [vault_identity_group_alias.oidc](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/identity_group_alias) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_oidc_auth_mount_accessor"></a> [oidc\_auth\_mount\_accessor](#input\_oidc\_auth\_mount\_accessor) | OIDC auth backend accessor from `vault_jwt_auth_backend` resource | `string` | n/a | yes |
| <a name="input_oidc_group_alias_name"></a> [oidc\_group\_alias\_name](#input\_oidc\_group\_alias\_name) | The identifier of the external OIDC group (normally, the group object ID) | `string` | n/a | yes |
| <a name="input_oidc_group_metadata"></a> [oidc\_group\_metadata](#input\_oidc\_group\_metadata) | Optional map of metadata to assign to the group | `map(any)` | `{}` | no |
| <a name="input_oidc_group_name"></a> [oidc\_group\_name](#input\_oidc\_group\_name) | Name of the external OIDC group (usually, it matches the name used in the external directory) | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_external_group"></a> [external\_group](#output\_external\_group) | External group resource (exposes the generated `vault_identity_group` resource) |
<!-- END_TF_DOCS -->