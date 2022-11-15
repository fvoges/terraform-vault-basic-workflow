locals {
  namespace    = var.namespace
  grp          = var.grp
  prefix       = var.prefix
  role          = var.role
  role_name    = format("%s-%s-%s", local.prefix, local.grp, local.role)
  backend_path = "approle"
  cert         = var.cert
}

data "vault_auth_backend" "tls" {
  path      = "cert"
  namespace = local.namespace
}

resource "vault_generic_endpoint" "cert_role" {
  path                 = "auth/cert/certs/${local.role_name}"
  ignore_absent_fields = true
  namespace            = local.namespace

  data_json = jsonencode({
    display_name         = local.role_name
    certificate          = local.cert
    allowed_common_names = local.role_name
  })
}

module "app_identity" {
  depends_on = [vault_generic_endpoint.cert_role]
  source     = "../../../terraform-vault-app_entity"

  namespace = local.namespace
  accessor  = data.vault_auth_backend.tls.accessor
  grp       = local.grp
  prefix    = local.prefix
  role       = local.role
}
