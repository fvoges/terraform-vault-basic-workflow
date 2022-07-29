# terraform-vault-auth-oidc

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
| [vault_jwt_auth_backend.default](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/jwt_auth_backend) | resource |
| [vault_jwt_auth_backend_role.default](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/jwt_auth_backend_role) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_oidc_client_id"></a> [oidc\_client\_id](#input\_oidc\_client\_id) | OIDC client ID | `string` | n/a | yes |
| <a name="input_oidc_client_secret"></a> [oidc\_client\_secret](#input\_oidc\_client\_secret) | OIDC Client secret. | `string` | n/a | yes |
| <a name="input_oidc_description"></a> [oidc\_description](#input\_oidc\_description) | Description for the OIDC Auth backend. | `string` | `"OIDC external directory"` | no |
| <a name="input_oidc_discovery_url"></a> [oidc\_discovery\_url](#input\_oidc\_discovery\_url) | Discovery URL for the OIDC Auth backend (see Vault's documentation). | `string` | n/a | yes |
| <a name="input_vault_hostname"></a> [vault\_hostname](#input\_vault\_hostname) | DNS name of the Vault cluster. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_oidc_auth_mount_accessor"></a> [oidc\_auth\_mount\_accessor](#output\_oidc\_auth\_mount\_accessor) | OIDC auth mount accessor |
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
| <a name="provider_vault"></a> [vault](#provider\_vault) | 3.7.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [vault_jwt_auth_backend.default](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/jwt_auth_backend) | resource |
| [vault_jwt_auth_backend_role.default](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/jwt_auth_backend_role) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_oidc_client_id"></a> [oidc\_client\_id](#input\_oidc\_client\_id) | OIDC client ID | `string` | n/a | yes |
| <a name="input_oidc_client_secret"></a> [oidc\_client\_secret](#input\_oidc\_client\_secret) | OIDC Client secret. | `string` | n/a | yes |
| <a name="input_oidc_description"></a> [oidc\_description](#input\_oidc\_description) | Description for the OIDC Auth backend. | `string` | `"OIDC external directory"` | no |
| <a name="input_oidc_discovery_url"></a> [oidc\_discovery\_url](#input\_oidc\_discovery\_url) | Discovery URL for the OIDC Auth backend (see Vault's documentation). | `string` | n/a | yes |
| <a name="input_vault_hostname"></a> [vault\_hostname](#input\_vault\_hostname) | DNS name of the Vault cluster. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_oidc_auth_mount_accessor"></a> [oidc\_auth\_mount\_accessor](#output\_oidc\_auth\_mount\_accessor) | OIDC auth mount accessor |
<!-- END_TF_DOCS -->