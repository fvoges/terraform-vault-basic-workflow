# terraform-vault-kubernetes_auth

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
| <a name="provider_vault"></a> [vault](#provider\_vault) | 3.7.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [vault_auth_backend.kubernetes](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/auth_backend) | resource |
| [vault_kubernetes_auth_backend_config.default](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/kubernetes_auth_backend_config) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_k8s_api_url"></a> [k8s\_api\_url](#input\_k8s\_api\_url) | Kubernetes API URL | `string` | n/a | yes |
| <a name="input_k8s_ca_cert"></a> [k8s\_ca\_cert](#input\_k8s\_ca\_cert) | Kubernetes CA certificate | `string` | n/a | yes |
| <a name="input_k8s_token_reviewer_jwt"></a> [k8s\_token\_reviewer\_jwt](#input\_k8s\_token\_reviewer\_jwt) | Kubernetes JWT reviewer token | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_accessor"></a> [accessor](#output\_accessor) | n/a |
<!-- END_TF_DOCS -->