# terraform-vault-internal-group

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
| [vault_identity_group.internal](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/identity_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_group_metadata"></a> [group\_metadata](#input\_group\_metadata) | Metadata to be added to the internal group (key => value pairs). | `map(any)` | `{}` | no |
| <a name="input_group_name"></a> [group\_name](#input\_group\_name) | Internal group name. | `string` | n/a | yes |
| <a name="input_member_group_ids"></a> [member\_group\_ids](#input\_member\_group\_ids) | List of group members. | `list(string)` | n/a | yes |
| <a name="input_vault_policies"></a> [vault\_policies](#input\_vault\_policies) | List of Vault ACL policies to attach to the group. | `list(any)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_internal_group"></a> [internal\_group](#output\_internal\_group) | Internal gropup resource. |
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
| <a name="provider_vault"></a> [vault](#provider\_vault) | 3.8.2 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [vault_identity_group.internal](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/identity_group) | resource |
| [vault_identity_group_policies.ns_admins](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/identity_group_policies) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allow_external_member_entity_ids"></a> [allow\_external\_member\_entity\_ids](#input\_allow\_external\_member\_entity\_ids) | If set to true, this module will ignore any Entity IDs returned from Vault or specified in the resource. | `bool` | `false` | no |
| <a name="input_group_metadata"></a> [group\_metadata](#input\_group\_metadata) | Metadata to be added to the internal group (key => value pairs). | `map(any)` | `{}` | no |
| <a name="input_group_name"></a> [group\_name](#input\_group\_name) | Internal group name. | `string` | n/a | yes |
| <a name="input_member_group_ids"></a> [member\_group\_ids](#input\_member\_group\_ids) | List of group members. | `list(string)` | n/a | yes |
| <a name="input_vault_policies"></a> [vault\_policies](#input\_vault\_policies) | List of Vault ACL policies to attach to the group. | `list(any)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_internal_group"></a> [internal\_group](#output\_internal\_group) | Internal gropup resource. |
<!-- END_TF_DOCS -->