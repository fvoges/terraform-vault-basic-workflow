locals {
  namespace   = var.namespace
  prefix      = var.prefix
  grp         = var.grp
  path_prefix = var.path_prefix == null ? "" : format("%s/", var.path_prefix)
}


data "vault_policy_document" "transit_shared_grp_full" {
  # rule {
  #   path         = "${local.prefix}transit/keys"
  #   capabilities = ["list"]
  #   description  = "allow listing of keys"
  # }

  rule {
    path         = "${local.path_prefix}transit/keys/${local.prefix}-${local.grp}/rotate"
    capabilities = ["update"]
    description  = "allow key rotation of group key"
  }

  rule {
    path         = "${local.path_prefix}transit/rewrap/${local.prefix}-${local.grp}"
    capabilities = ["update"]
    description  = "allow cyphertext rewrapping using group key"
  }

  rule {
    path         = "${local.path_prefix}transit/decrypt/${local.prefix}-${local.grp}"
    capabilities = ["update"]
    description  = "allow decryption using group key"
  }

  rule {
    path         = "${local.path_prefix}transit/encrypt/${local.prefix}-${local.grp}"
    capabilities = ["update"]
    description  = "allow encryption using group key"
  }
}

resource "vault_policy" "transit_shared_grp_full" {
  name      = "shared-transit-grp-full"
  policy    = data.vault_policy_document.transit_shared_grp_full.hcl
  namespace = local.namespace
}

resource "vault_identity_group" "transit_shared_grp_full" {
  name                       = "shared-transit-grp-full"
  type                       = "internal"
  policies                   = ["shared-transit-grp-full"]
  external_member_entity_ids = true
  namespace                  = local.namespace
}


data "vault_policy_document" "transit_shared_grp_decrypt" {
  # rule {
  #   path         = "${local.path_prefix}transit/keys"
  #   capabilities = ["list"]
  #   description  = "allow listing of keys"
  # }

  rule {
    path         = "${local.path_prefix}transit/encrypt/${local.prefix}-${local.grp}"
    capabilities = ["update"]
    description  = "allow decryption using group key"
  }
}

resource "vault_policy" "transit_shared_grp_decrypt" {
  name      = "shared-transit-grp-decrypt"
  policy    = data.vault_policy_document.transit_shared_grp_decrypt.hcl
  namespace = local.namespace
}

resource "vault_identity_group" "transit_shared_grp_decrypt" {
  name                       = "shared-transit-grp-decrypt"
  type                       = "internal"
  policies                   = ["shared-transit-grp-decrypt"]
  external_member_entity_ids = true
  namespace                  = local.namespace
}

data "vault_policy_document" "transit_shared_grp_encrypt" {
  # rule {
  #   path         = "${local.path_prefix}transit/keys"
  #   capabilities = ["list"]
  #   description  = "allow listing of keys"
  # }

  rule {
    path         = "${local.path_prefix}transit/encrypt/${local.prefix}-${local.grp}"
    capabilities = ["update"]
    description  = "allow encryption using group key"
  }
}

resource "vault_policy" "transit_shared_grp_encrypt" {
  name      = "shared-transit-grp-encrypt"
  policy    = data.vault_policy_document.transit_shared_grp_encrypt.hcl
  namespace = local.namespace
}

resource "vault_identity_group" "transit_shared_grp_encrypt" {
  name                       = "shared-transit-grp-encrypt"
  type                       = "internal"
  policies                   = ["shared-transit-grp-encrypt"]
  external_member_entity_ids = true
  namespace                  = local.namespace
}

