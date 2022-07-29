locals {
  prefix    = var.prefix == null ? "" : format("%s/", var.prefix)
  namespace = var.namespace
}

data "vault_policy_document" "transit_app_full" {
  # rule {
  #   path         = "${local.prefix}transit/keys"
  #   capabilities = ["list"]
  #   description  = "allow listing of keys"
  # }

  rule {
    path         = "${local.prefix}transit/keys/{{identity.entity.metadata.prefix}}-{{identity.entity.metadata.grp}}-{{identity.entity.metadata.app}}/rotate"
    capabilities = ["update"]
    description  = "allow key rotation of app-specific key"
  }

  rule {
    path         = "${local.prefix}transit/rewrap/{{identity.entity.metadata.prefix}}-{{identity.entity.metadata.grp}}-{{identity.entity.metadata.app}}"
    capabilities = ["update"]
    description  = "allow cyphertext rewrapping using app-specific key"
  }

  rule {
    path         = "${local.prefix}transit/decrypt/{{identity.entity.metadata.prefix}}-{{identity.entity.metadata.grp}}-{{identity.entity.metadata.app}}"
    capabilities = ["update"]
    description  = "allow decryption using app-specific key"
  }
  rule {
    path         = "${local.prefix}transit/encrypt/{{identity.entity.metadata.prefix}}-{{identity.entity.metadata.grp}}-{{identity.entity.metadata.app}}"
    capabilities = ["update"]
    description  = "allow encryption using app-specific key"
  }
}

resource "vault_policy" "transit_app_full" {
  name      = "templated-transit-app-full"
  policy    = data.vault_policy_document.transit_app_full.hcl
  namespace = local.namespace
}

resource "vault_identity_group" "transit_app_full" {
  name                       = "templated-transit-app-full"
  type                       = "internal"
  policies                   = ["templated-transit-app-full"]
  external_member_entity_ids = true
  namespace                  = local.namespace
}

data "vault_policy_document" "transit_grp_full" {
  # rule {
  #   path         = "${local.prefix}transit/keys"
  #   capabilities = ["list"]
  #   description  = "allow listing of keys"
  # }

  rule {
    path         = "${local.prefix}transit/keys/{{identity.entity.metadata.prefix}}-{{identity.entity.metadata.grp}}/rotate"
    capabilities = ["update"]
    description  = "allow key rotation of group key"
  }

  rule {
    path         = "${local.prefix}transit/rewrap/{{identity.entity.metadata.prefix}}-{{identity.entity.metadata.grp}}"
    capabilities = ["update"]
    description  = "allow cyphertext rewrapping using group key"
  }

  rule {
    path         = "${local.prefix}transit/decrypt/{{identity.entity.metadata.prefix}}-{{identity.entity.metadata.grp}}"
    capabilities = ["update"]
    description  = "allow decryption using group key"
  }

  rule {
    path         = "${local.prefix}transit/encrypt/{{identity.entity.metadata.prefix}}-{{identity.entity.metadata.grp}}"
    capabilities = ["update"]
    description  = "allow encryption using group key"
  }
}

resource "vault_policy" "transit_grp_full" {
  name      = "templated-transit-grp-full"
  policy    = data.vault_policy_document.transit_grp_full.hcl
  namespace = local.namespace

}

resource "vault_identity_group" "transit_grp_full" {
  name                       = "templated-transit-grp-full"
  type                       = "internal"
  policies                   = ["templated-transit-grp-full"]
  external_member_entity_ids = true
  namespace                  = local.namespace

}


data "vault_policy_document" "transit_grp_decrypt" {
  # rule {
  #   path         = "${local.prefix}transit/keys"
  #   capabilities = ["list"]
  #   description  = "allow listing of keys"
  # }

  rule {
    path         = "${local.prefix}transit/decrypt/{{identity.entity.metadata.prefix}}-{{identity.entity.metadata.grp}}"
    capabilities = ["update"]
    description  = "allow decryption using group key"
  }
}

resource "vault_policy" "transit_grp_decrypt" {
  name      = "templated-transit-grp-decrypt"
  policy    = data.vault_policy_document.transit_grp_decrypt.hcl
  namespace = local.namespace

}

resource "vault_identity_group" "transit_grp_decrypt" {
  name                       = "templated-transit-grp-decrypt"
  type                       = "internal"
  policies                   = ["templated-transit-grp-decrypt"]
  external_member_entity_ids = true
  namespace                  = local.namespace

}

data "vault_policy_document" "transit_grp_encrypt" {
  # rule {
  #   path         = "${local.prefix}transit/keys"
  #   capabilities = ["list"]
  #   description  = "allow listing of keys"
  # }

  rule {
    path         = "${local.prefix}transit/encrypt/{{identity.entity.metadata.prefix}}-{{identity.entity.metadata.grp}}"
    capabilities = ["update"]
    description  = "allow encryption using group key"
  }
}

resource "vault_policy" "transit_grp_encrypt" {
  name      = "templated-transit-grp-encrypt"
  policy    = data.vault_policy_document.transit_grp_encrypt.hcl
  namespace = local.namespace
}

resource "vault_identity_group" "transit_grp_encrypt" {
  name                       = "templated-transit-grp-encrypt"
  type                       = "internal"
  policies                   = ["templated-transit-grp-encrypt"]
  external_member_entity_ids = true
  namespace                  = local.namespace
}


