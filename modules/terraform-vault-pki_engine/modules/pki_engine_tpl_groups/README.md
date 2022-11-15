# terraform-vault-pki_engine_tpl_groups

Manage templated policies and groups for PKI secrets engine.

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
| [vault_identity_group.kv_app_read](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/identity_group) | resource |
| [vault_identity_group.kv_grp_read](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/identity_group) | resource |
| [vault_policy.kv_app_read](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/policy) | resource |
| [vault_policy.kv_grp_read](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/policy) | resource |
| [vault_policy_document.kv_app_read](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/policy_document) | data source |
| [vault_policy_document.kv_grp_read](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Namespace to operate in | `string` | `null` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | Path prefix for all the rules. | `string` | `null` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->