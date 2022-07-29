# terraform-vault-app_identity

Manage group membership for application entities.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_vault"></a> [vault](#requirement\_vault) | ~> 3 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_vault"></a> [vault](#provider\_vault) | 3.5.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [vault_identity_group_member_entity_ids.members](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/identity_group_member_entity_ids) | resource |
| [vault_identity_entity.entity](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/identity_entity) | data source |
| [vault_identity_group.group](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/identity_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_entity_name"></a> [entity\_name](#input\_entity\_name) | Entity name to add to group | `string` | n/a | yes |
| <a name="input_group_name"></a> [group\_name](#input\_group\_name) | Group name to add entity to | `string` | n/a | yes |
| <a name="input_group_namespace"></a> [group\_namespace](#input\_group\_namespace) | Group namespace if different than the entity (this needs to be a child of the entity namespace) | `string` | `null` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->