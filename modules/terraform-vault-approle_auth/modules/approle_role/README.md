# terraform-vault-approle_role

Manage AppRole role and it's related entity and entity alias.

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

| Name | Source | Version |
|------|--------|---------|
| <a name="module_app_identity"></a> [app\_identity](#module\_app\_identity) | ../../../terraform-vault-app_entity | n/a |

## Resources

| Name | Type |
|------|------|
| [vault_approle_auth_backend_role.default](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/approle_auth_backend_role) | resource |
| [vault_auth_backend.approle](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/auth_backend) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_grp"></a> [grp](#input\_grp) | Application group name | `string` | n/a | yes |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Namespace to operate in | `string` | `null` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | Application prefix. Normally used for the environment name (e.g., prod, qa, uat, dev, etc.) | `string` | n/a | yes |
| <a name="input_role"></a> [role](#input\_role) | Application/service name | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->