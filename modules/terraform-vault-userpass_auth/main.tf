locals {
  namespace          = var.namespace
  default_lease_ttl  = null
  max_lease_ttl      = null
  listing_visibility = null
  token_type         = null
}

resource "vault_auth_backend" "default" {
  type      = "userpass"
  namespace = var.namespace

  tune {
    default_lease_ttl  = local.default_lease_ttl
    max_lease_ttl      = local.max_lease_ttl
    listing_visibility = local.listing_visibility
    token_type         = local.token_type
  }
}
