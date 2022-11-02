# terraform-vault-approle_auth

Enable AppRole auth method.

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
| [vault_auth_backend.default](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/auth_backend) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Namespace to operate in | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_accessor"></a> [accessor](#output\_accessor) | n/a |
<!-- END_TF_DOCS -->