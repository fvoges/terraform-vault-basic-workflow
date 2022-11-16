# terraform-vault-bu_namespace

Opinionated Vault namespace with optional authentication methods.

Each can be turned on and off with input variables.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_vault"></a> [vault](#requirement\_vault) | >= 3.7.0, < 4.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_vault"></a> [vault](#provider\_vault) | 3.7.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_approle_auth"></a> [approle\_auth](#module\_approle\_auth) | ../terraform-vault-approle_auth | n/a |
| <a name="module_userpass_auth"></a> [userpass\_auth](#module\_userpass\_auth) | ../terraform-vault-userpass_auth | n/a |

## Resources

| Name | Type |
|------|------|
| [vault_namespace.default](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/namespace) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_enable_approle_auth"></a> [enable\_approle\_auth](#input\_enable\_approle\_auth) | Enable AppRole auth method | `bool` | `false` | no |
| <a name="input_enable_userpass_auth"></a> [enable\_userpass\_auth](#input\_enable\_userpass\_auth) | Enable UserPass auth method | `bool` | `false` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | The namespace to manage | `string` | n/a | yes |
| <a name="input_parent_namespace"></a> [parent\_namespace](#input\_parent\_namespace) | The namespace will be created under this namespace | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_approle_mount_accessor"></a> [approle\_mount\_accessor](#output\_approle\_mount\_accessor) | n/a |
| <a name="output_namespace_path"></a> [namespace\_path](#output\_namespace\_path) | n/a |
<!-- END_TF_DOCS -->