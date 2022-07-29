# terraform-vault-namespace

Opinionated Vault namespace creation supporting: AppRole auth, TLS auth, KV secrets engine, and Transit secrets engine.

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
| <a name="module_kv_engine"></a> [kv\_engine](#module\_kv\_engine) | ../terraform-vault-kv_engine | n/a |
| <a name="module_kv_engine_tpl_groups"></a> [kv\_engine\_tpl\_groups](#module\_kv\_engine\_tpl\_groups) | ../terraform-vault-kv_engine/modules/kv_engine_tpl_groups | n/a |
| <a name="module_tls_auth"></a> [tls\_auth](#module\_tls\_auth) | ../terraform-vault-tls_auth | n/a |
| <a name="module_transit_engine"></a> [transit\_engine](#module\_transit\_engine) | ../terraform-vault-transit_engine | n/a |
| <a name="module_transit_engine_shared_groups"></a> [transit\_engine\_shared\_groups](#module\_transit\_engine\_shared\_groups) | ../terraform-vault-transit_engine/modules/transit_engine_shared_groups | n/a |
| <a name="module_transit_engine_tpl_groups"></a> [transit\_engine\_tpl\_groups](#module\_transit\_engine\_tpl\_groups) | ../terraform-vault-transit_engine/modules/transit_engine_tpl_groups | n/a |

## Resources

| Name | Type |
|------|------|
| [vault_generic_secret.key](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/generic_secret) | resource |
| [vault_namespace.default](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/namespace) | resource |
| [vault_transit_secret_backend_key.key](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/transit_secret_backend_key) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_group_kv_secret"></a> [create\_group\_kv\_secret](#input\_create\_group\_kv\_secret) | Create group KV secret | `bool` | `false` | no |
| <a name="input_create_group_transit_secret"></a> [create\_group\_transit\_secret](#input\_create\_group\_transit\_secret) | Create group Transit key | `bool` | `false` | no |
| <a name="input_create_shared_policy_groups"></a> [create\_shared\_policy\_groups](#input\_create\_shared\_policy\_groups) | Create shared policy groups for Transit secrets engine | `bool` | `true` | no |
| <a name="input_create_tpl_policy_groups"></a> [create\_tpl\_policy\_groups](#input\_create\_tpl\_policy\_groups) | Create templated policy groups for enabled secret engines | `bool` | `true` | no |
| <a name="input_enable_approle_auth"></a> [enable\_approle\_auth](#input\_enable\_approle\_auth) | Enable AppRole auth method | `bool` | `false` | no |
| <a name="input_enable_k8s_auth"></a> [enable\_k8s\_auth](#input\_enable\_k8s\_auth) | Enable Kubernetes auth method | `bool` | `false` | no |
| <a name="input_enable_kv_secrets"></a> [enable\_kv\_secrets](#input\_enable\_kv\_secrets) | Enable KV secrets engine | `bool` | `false` | no |
| <a name="input_enable_tls_auth"></a> [enable\_tls\_auth](#input\_enable\_tls\_auth) | Enable TLS auth method | `bool` | `false` | no |
| <a name="input_enable_transit_secrets"></a> [enable\_transit\_secrets](#input\_enable\_transit\_secrets) | Enable Transit secrets engine | `bool` | `false` | no |
| <a name="input_grp"></a> [grp](#input\_grp) | Application group name | `string` | n/a | yes |
| <a name="input_k8s_api_url"></a> [k8s\_api\_url](#input\_k8s\_api\_url) | Kubernetes API URL | `string` | `null` | no |
| <a name="input_k8s_ca_cert"></a> [k8s\_ca\_cert](#input\_k8s\_ca\_cert) | Kubernetes CA certificate | `string` | `null` | no |
| <a name="input_k8s_token_reviewer_jwt"></a> [k8s\_token\_reviewer\_jwt](#input\_k8s\_token\_reviewer\_jwt) | Kubernetes JWT reviewer token | `string` | `null` | no |
| <a name="input_parent_namespace"></a> [parent\_namespace](#input\_parent\_namespace) | The namespace will be created under this namespace | `string` | `""` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | Application prefix. Normally used for the environment name (e.g., prod, qa, uat, dev, etc.) | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_namespace"></a> [namespace](#output\_namespace) | n/a |
| <a name="output_parent_namespace"></a> [parent\_namespace](#output\_parent\_namespace) | n/a |
<!-- END_TF_DOCS -->