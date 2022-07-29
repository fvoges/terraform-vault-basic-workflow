# Terraform Vault basic workflow


> **NOTE:** This code uses the new `namespace` resource parameter of the [Terraform Vault provider](https://registry.terraform.io/providers/hashicorp/vault/), so it requires version 3.7.0 or greater to work

## Contents

The Terraform code is split in two directories, one for modules, and one for configurations.

All the code has been checked with `terraform validate`, `terraformt fmt`, and the documentation has been generated using `terraform-docs`.

Each code directory contains a `README.md`.

### Scripts

The scripts in this directory are provided for reference only, and are not required. They expect a local Vault server running in dev mode in a loop.

### Configuration data

Some of the example data might need updating before some functionality can be used (e.g., TLS auth CA cert). All the configuration data expect some namespaces to be present.

### Configurations

This directory contains the different Terraform configurations. This is the code used with `terraform apply`, and they depend on the Terraform modules in the `modules` directory.

#### `terraform-vault-admin`

This directory can be mostly ignored. It applies a basic configuration for Vault:

- Admin "superuser" using userpass auth method
- Enable audit logs
- Create DR replication recovery policy and token role
- Create basic namespaces

Not required beyond local testing.

#### `terraform-vault-ns`

Configures a namespace using modules. There are example Terraform variable files (`*.tfvars`) can be used to setup different types of application namespaces.

#### `terraform-vault-app_ns`

Configures an Application namespace using modules. There are example Terraform variable files (`*.tfvars`) can be used to setup different types of application namespaces.

#### `terraform-vault-app`

Configures application roles inside namespaces. There are example Terraform variable files (`*.tfvars`) can be used to setup different types of application roles.

### Modules

These are reusable Terraform modules. They abstract the repeatable configurations to avoid code duplication and make it easier to maintain.

Each module will be ideally stored in a separate git repository, and published to your private Terraform Registry.

#### Module `terraform-vault-app_identity`

Manage entity and entity alias for application roles. It includes the metadata used by templated ACL policies.

##### Submodule `entity_group_membership`

Manage group membership for application entities.

#### Module `terraform-vault-approle_auth`

Enable AppRole auth method.

##### Submodule `approle_role`

Manage AppRole role and it's related entity and entity alias.

#### Module `terraform-vault-kv_engine`

Enable KV secrets engine.

##### Submodule `terraform-vault-kv_engine_tpl_groups`

Manage templated policies and groups for KV secrets engine.

#### Module `terraform-vault-namespace`

#### Submodule `basic-namespace`

#### Submodule `app-namespace`

Opinionated Vault namespace creation supporting: AppRole auth, TLS auth, KV secrets engine, and Transit secrets engine.

Each can be turned on and off with input variables.

#### Module `terraform-vault-tls_auth`

Enable TLS auth method.

##### Submodule `tls_role`

Manage TLS role and it's related entity and entity alias.

#### Module `terraform-vault-transit_engine`

Enable Transit secrets engine.

##### Submodule `transit_engine_shared_groups`

Manage custom policies and groups for Transit secrets engine in shared namespaces.

##### Submodule `transit_engine_tpl_groups`

Manage templated ACL policies and groups for Transit secrets engine.

## Off-line use

```shell
VERSION="3.7.0"
OS="linux"
ARCH="amd64"

# Provider URL https://releases.hashicorp.com/terraform-provider-vault/$VERSION/terraform-provider-vault_$VERSION_$OS_$ARCH.zip

# if you extract the zip file:
mkdir -p .terraform.d/plugins/registry.terraform.io/hashicorp/vault/$VERSION/$OS_$ARCH
cd terraform-provider-vault_$VERSION_$OS_$ARCH.zip .terraform.d/plugins/registry.terraform.io/hashicorp/vault/$VERSION/$OS_$ARCH

# if you use the zip file directly
mkdir -p .terraform.d/plugins/registry.terraform.io/hashicorp/vault/$VERSION
cd terraform-provider-vault_$VERSION_$OS_$ARCH.zip .terraform.d/plugins/registry.terraform.io/hashicorp/vault/$VERSION
```
