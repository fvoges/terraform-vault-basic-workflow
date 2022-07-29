
resource "vault_jwt_auth_backend" "default" {
  description        = var.oidc_description
  path               = "oidc"
  type               = "oidc"
  oidc_discovery_url = var.oidc_discovery_url
  oidc_client_id     = var.oidc_client_id
  oidc_client_secret = var.oidc_client_secret
  default_role       = "default"
  tune {
    listing_visibility = "unauth"
    max_lease_ttl      = "8760h"
    default_lease_ttl  = "8760h"
    token_type         = "default-service"
  }
}

# we only have a default role that assigns a default policy
# we're going to use external groups to assign permissions
resource "vault_jwt_auth_backend_role" "default" {
  backend               = vault_jwt_auth_backend.default.path
  role_name             = "default"
  token_policies        = ["default"]
  user_claim            = "email"
  groups_claim          = "groups"
  role_type             = "oidc"
  allowed_redirect_uris = ["http://localhost:8250/oidc/callback", "http://${var.vault_hostname}:8200/ui/vault/auth/oidc/oidc/callback"]
  oidc_scopes           = ["https://graph.microsoft.com/.default"]
}

