# terraform-vault-admin

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
| <a name="module_admin_user"></a> [admin\_user](#module\_admin\_user) | ../../modules/terraform-vault-userpass_auth/modules/userpass_user | n/a |
| <a name="module_mfa_pingid"></a> [mfa\_pingid](#module\_mfa\_pingid) | ../../modules/terraform-vault-mfa/modules/mfa_pingid | n/a |
| <a name="module_oidc_admin_group"></a> [oidc\_admin\_group](#module\_oidc\_admin\_group) | ../../modules/terraform-vault-oidc_auth/modules/oidc_group | n/a |
| <a name="module_oidc_auth"></a> [oidc\_auth](#module\_oidc\_auth) | ../../modules/terraform-vault-oidc_auth | n/a |
| <a name="module_org_namespace"></a> [org\_namespace](#module\_org\_namespace) | ../../modules/terraform-vault-namespace/modules/basic_namespace | n/a |
| <a name="module_super_user"></a> [super\_user](#module\_super\_user) | ../../modules/terraform-vault-userpass_auth/modules/userpass_user | n/a |
| <a name="module_userpass_auth"></a> [userpass\_auth](#module\_userpass\_auth) | ../../modules/terraform-vault-userpass_auth | n/a |
| <a name="module_vault_admin_group"></a> [vault\_admin\_group](#module\_vault\_admin\_group) | ../../modules/terraform-vault-internal_group | n/a |

## Resources

| Name | Type |
|------|------|
| [vault_audit.file](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/audit) | resource |
| [vault_audit.syslog](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/audit) | resource |
| [vault_identity_group_member_entity_ids.others](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/identity_group_member_entity_ids) | resource |
| [vault_identity_group_member_group_ids.oidc_vault_admins](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/identity_group_member_group_ids) | resource |
| [vault_policy.superuser](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/policy) | resource |
| [vault_policy.vault_admins](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/policy) | resource |
| [vault_identity_entity.admin_user](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/identity_entity) | data source |
| [vault_policy_document.superuser](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_mfa_enforcement_name"></a> [mfa\_enforcement\_name](#input\_mfa\_enforcement\_name) | MFA login enforcement name | `string` | `"pingid_oidc_auth"` | no |
| <a name="input_mfa_settings_file"></a> [mfa\_settings\_file](#input\_mfa\_settings\_file) | PingID MFA settings file | `string` | `null` | no |
| <a name="input_mfa_username_format"></a> [mfa\_username\_format](#input\_mfa\_username\_format) | PingID MFA username format | `string` | `null` | no |
| <a name="input_oidc_admin_group_name"></a> [oidc\_admin\_group\_name](#input\_oidc\_admin\_group\_name) | Name for the Vault admins OIDC external group. | `string` | `null` | no |
| <a name="input_oidc_admin_group_oid"></a> [oidc\_admin\_group\_oid](#input\_oidc\_admin\_group\_oid) | OID for the Vault admins OIDC group. | `string` | `null` | no |
| <a name="input_oidc_auth_enable"></a> [oidc\_auth\_enable](#input\_oidc\_auth\_enable) | Enable OIDC auth for root namespace | `bool` | `false` | no |
| <a name="input_oidc_client_id"></a> [oidc\_client\_id](#input\_oidc\_client\_id) | OIDC client ID | `string` | `null` | no |
| <a name="input_oidc_client_secret"></a> [oidc\_client\_secret](#input\_oidc\_client\_secret) | OIDC Client secret. | `string` | `null` | no |
| <a name="input_oidc_description"></a> [oidc\_description](#input\_oidc\_description) | Description for the OIDC Auth backend. | `string` | `"OIDC external directory"` | no |
| <a name="input_oidc_discovery_url"></a> [oidc\_discovery\_url](#input\_oidc\_discovery\_url) | Discovery URL for the OIDC Auth backend (see Vault's documentation). | `string` | `null` | no |
| <a name="input_org_namespace"></a> [org\_namespace](#input\_org\_namespace) | Organization-level namespace name. This namespace will contain all the other namespaces for the org | `string` | `"acme"` | no |
| <a name="input_root_namespace"></a> [root\_namespace](#input\_root\_namespace) | Root namespace name ('' or 'admin'). | `string` | `""` | no |
| <a name="input_vault_audit_log_enable_filepath"></a> [vault\_audit\_log\_enable\_filepath](#input\_vault\_audit\_log\_enable\_filepath) | Enable filepath audit device | `bool` | `true` | no |
| <a name="input_vault_audit_log_enable_syslog"></a> [vault\_audit\_log\_enable\_syslog](#input\_vault\_audit\_log\_enable\_syslog) | Enable syslog audit device | `bool` | `true` | no |
| <a name="input_vault_audit_log_file_path"></a> [vault\_audit\_log\_file\_path](#input\_vault\_audit\_log\_file\_path) | Vault audit log file location. The directory must exist and the Vault daemon user must have write permissions to it | `string` | `"/var/log/vault/audit.log"` | no |
| <a name="input_vault_audit_log_raw"></a> [vault\_audit\_log\_raw](#input\_vault\_audit\_log\_raw) | If 'true', logs the security sensitive information without hashing, in the raw format | `bool` | `false` | no |
| <a name="input_vault_hostname"></a> [vault\_hostname](#input\_vault\_hostname) | DNS name of the Vault cluster. Used for the OIDC call-back url. | `string` | `null` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->