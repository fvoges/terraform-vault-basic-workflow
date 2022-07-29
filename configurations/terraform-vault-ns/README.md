# terraform-vault-ns

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0, < 2.0.0 |
| <a name="requirement_vault"></a> [vault](#requirement\_vault) | >= 3.7.0, < 4.0.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_namespace"></a> [namespace](#module\_namespace) | ../../modules/terraform-vault-namespace/modules/basic_namespace | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_enable_approle_auth"></a> [enable\_approle\_auth](#input\_enable\_approle\_auth) | Enable AppRole auth method | `bool` | `false` | no |
| <a name="input_enable_userpass_auth"></a> [enable\_userpass\_auth](#input\_enable\_userpass\_auth) | Enable UserPass auth method | `bool` | `false` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | The namespace to manage | `string` | n/a | yes |
| <a name="input_parent_namespace"></a> [parent\_namespace](#input\_parent\_namespace) | The namespace will be created under this namespace | `string` | `""` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->