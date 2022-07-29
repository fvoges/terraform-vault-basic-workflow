# terraform-vault-transit_engine_shared_groups

Manage custom policies and groups for Transit secrets engine in shared namespaces.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0, < 2.0.0 |
| <a name="requirement_vault"></a> [vault](#requirement\_vault) | >= 3.7.0, < 4.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_vault"></a> [vault](#provider\_vault) | >= 3.7.0, < 4.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [vault_identity_group.transit_shared_grp_decrypt](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/identity_group) | resource |
| [vault_identity_group.transit_shared_grp_encrypt](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/identity_group) | resource |
| [vault_identity_group.transit_shared_grp_full](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/identity_group) | resource |
| [vault_policy.transit_shared_grp_decrypt](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/policy) | resource |
| [vault_policy.transit_shared_grp_encrypt](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/policy) | resource |
| [vault_policy.transit_shared_grp_full](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/policy) | resource |
| [vault_policy_document.transit_shared_grp_decrypt](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/policy_document) | data source |
| [vault_policy_document.transit_shared_grp_encrypt](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/policy_document) | data source |
| [vault_policy_document.transit_shared_grp_full](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_grp"></a> [grp](#input\_grp) | Application group name | `string` | n/a | yes |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Namespace to operate in | `string` | `null` | no |
| <a name="input_path_prefix"></a> [path\_prefix](#input\_path\_prefix) | Path prefix for all the rules. | `string` | `null` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | Application prefix. Normally used for the environment name (e.g., prod, qa, uat, dev, etc.) | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->