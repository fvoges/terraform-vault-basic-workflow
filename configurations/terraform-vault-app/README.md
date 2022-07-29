
# terraform-vault-app

```mermaid
flowchart TB
classDef someclass fill:#f96,stroke-dasharray: 5 5;
class app_ns someclass

subgraph app_ns [application group namespace]
direction TB
  app_auth[app authentication]
  role --> app_auth

  subgraph App [This module]
    direction TB
    role[app role]

    subgraph entity-alias [ ]
      direction TB
      alias[app entity alias]
      entity[app entity]
      alias --> entity
    end

  end

alias --> role
entity -- membership managed by this module --> group1
entity -- membership managed by this module --> group2

  subgraph secrets_engine[managed by namespace module]
    direction TB
    subgraph group_and_policies1[ ]
      direction TB
        group1[group]
        policy1[policy]
        group1-->policy1
    end
    subgraph group_and_policies2[ ]
      direction TB
        group2[group]
        policy2[policy]
        group2-->policy2
    end
    policy1 -.->secrets
    policy2 -.->secrets
    secrets
  end

end
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0, < 2.0.0 |
| <a name="requirement_vault"></a> [vault](#requirement\_vault) | >= 3.7.0, < 4.0.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_application"></a> [application](#module\_application) | ../../modules/terraform-vault-application | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app"></a> [app](#input\_app) | Application name | `string` | n/a | yes |
| <a name="input_app_group_membership"></a> [app\_group\_membership](#input\_app\_group\_membership) | Application groups this application is a member of | `set(string)` | `[]` | no |
| <a name="input_auth_type"></a> [auth\_type](#input\_auth\_type) | App authentication type | `string` | n/a | yes |
| <a name="input_create_app_kv_secret"></a> [create\_app\_kv\_secret](#input\_create\_app\_kv\_secret) | Create app KV secret | `bool` | `false` | no |
| <a name="input_create_app_transit_secret"></a> [create\_app\_transit\_secret](#input\_create\_app\_transit\_secret) | Create app transit key | `bool` | `false` | no |
| <a name="input_grp"></a> [grp](#input\_grp) | Application group name | `string` | n/a | yes |
| <a name="input_parent_namespace"></a> [parent\_namespace](#input\_parent\_namespace) | The namespace will be created under this namespace | `string` | `""` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | Application prefix. Normally used for the environment name (e.g., prod, qa, uat, dev, etc.) | `string` | n/a | yes |
| <a name="input_shared_group_membership"></a> [shared\_group\_membership](#input\_shared\_group\_membership) | Application groups this application is a member of | `set(string)` | `[]` | no |
| <a name="input_shared_group_namespace"></a> [shared\_group\_namespace](#input\_shared\_group\_namespace) | Namespace for the  groups, if different from the application auth namespace | `string` | `null` | no |
| <a name="input_tls_role_ca_cert"></a> [tls\_role\_ca\_cert](#input\_tls\_role\_ca\_cert) | CA certificate for TLS roles | `string` | `""` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->