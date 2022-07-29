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
| <a name="module_namespace"></a> [namespace](#module\_namespace) | ../../modules/terraform-vault-namespace/modules/app_namespace | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_group_kv_secret"></a> [create\_group\_kv\_secret](#input\_create\_group\_kv\_secret) | Create group KV secret | `bool` | `false` | no |
| <a name="input_create_group_transit_secret"></a> [create\_group\_transit\_secret](#input\_create\_group\_transit\_secret) | Create group transit key | `bool` | `false` | no |
| <a name="input_create_tpl_policy_groups"></a> [create\_tpl\_policy\_groups](#input\_create\_tpl\_policy\_groups) | Create templated policy groups for enabled transit engines | `bool` | `true` | no |
| <a name="input_enable_approle_auth"></a> [enable\_approle\_auth](#input\_enable\_approle\_auth) | Enable TLS auth method | `bool` | `false` | no |
| <a name="input_enable_kv_secrets"></a> [enable\_kv\_secrets](#input\_enable\_kv\_secrets) | Enable KV secrets engine | `bool` | `false` | no |
| <a name="input_enable_tls_auth"></a> [enable\_tls\_auth](#input\_enable\_tls\_auth) | Enable TLS auth method | `bool` | `false` | no |
| <a name="input_enable_transit_secrets"></a> [enable\_transit\_secrets](#input\_enable\_transit\_secrets) | Enable Transit secrets engine | `bool` | `false` | no |
| <a name="input_grp"></a> [grp](#input\_grp) | Application group name | `string` | n/a | yes |
| <a name="input_parent_namespace"></a> [parent\_namespace](#input\_parent\_namespace) | The namespace will be created under this namespace | `string` | `""` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | Application prefix. Normally used for the environment name (e.g., prod, qa, uat, dev, etc.) | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->