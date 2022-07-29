locals {
  k8s_api_url            = var.k8s_api_url
  k8s_ca_cert            = var.k8s_ca_cert
  k8s_token_reviewer_jwt = var.k8s_token_reviewer_jwt
}

resource "vault_auth_backend" "kubernetes" {
  type = "kubernetes"
}

resource "vault_kubernetes_auth_backend_config" "default" {
  backend                = vault_auth_backend.kubernetes.path
  kubernetes_host        = local.k8s_api_url
  kubernetes_ca_cert     = local.k8s_ca_cert
  token_reviewer_jwt     = local.k8s_token_reviewer_jwt
  disable_iss_validation = "true"
}
