# terraform-vault-admin

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

| Name | Source | Version |
|------|--------|---------|
| <a name="module_userpass_auth"></a> [userpass\_auth](#module\_userpass\_auth) | ../../modules/terraform-vault-userpass_auth | n/a |
| <a name="module_userpass_user"></a> [userpass\_user](#module\_userpass\_user) | ../../modules/terraform-vault-userpass_auth/modules/userpass_user | n/a |

## Resources

| Name | Type |
|------|------|
| [vault_audit.file](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/audit) | resource |
| [vault_audit.syslog](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/audit) | resource |
| [vault_namespace.org](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/namespace) | resource |
| [vault_policy.dr_secondary_promotion](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/policy) | resource |
| [vault_policy.superuser](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/policy) | resource |
| [vault_policy.vault_admins](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/policy) | resource |
| [vault_token_auth_backend_role.failover_handler](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/token_auth_backend_role) | resource |
| [vault_policy_document.dr_secondary_promotion](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/policy_document) | data source |
| [vault_policy_document.superuser](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/policy_document) | data source |
| [vault_policy_document.vault_admin](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_org_namespace"></a> [org\_namespace](#input\_org\_namespace) | Organization-level namespace name. This namespace will contain all the other namespaces for the org | `string` | `"acme"` | no |
| <a name="input_vault_audit_log_enable_filepath"></a> [vault\_audit\_log\_enable\_filepath](#input\_vault\_audit\_log\_enable\_filepath) | Enable filepath audit device | `bool` | `true` | no |
| <a name="input_vault_audit_log_enable_syslog"></a> [vault\_audit\_log\_enable\_syslog](#input\_vault\_audit\_log\_enable\_syslog) | Enable syslog audit device | `bool` | `true` | no |
| <a name="input_vault_audit_log_file_path"></a> [vault\_audit\_log\_file\_path](#input\_vault\_audit\_log\_file\_path) | Vault audit log file location. The directory must exist and the Vault daemon user must have write permissions to it | `string` | `"/var/log/vault/audit.log"` | no |
| <a name="input_vault_audit_log_raw"></a> [vault\_audit\_log\_raw](#input\_vault\_audit\_log\_raw) | If 'true', logs the security sensitive information without hashing, in the raw format | `bool` | `false` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->