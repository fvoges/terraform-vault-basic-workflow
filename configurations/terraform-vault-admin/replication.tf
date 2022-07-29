
data "vault_policy_document" "dr_secondary_promotion" {
  rule {
    path         = "sys/replication/dr/secondary/promote"
    capabilities = ["update"]
  }

  rule {
    path         = "sys/replication/dr/secondary/update-primary"
    capabilities = ["update"]
    description  = "To update the primary to connect"
  }

  rule {
    path         = "sys/storage/raft/autopilot/state"
    capabilities = ["update", "read"]
    description  = "To read the current autopilot status"
  }

}

resource "vault_policy" "dr_secondary_promotion" {
  name   = "dr-secondary-promotion"
  policy = data.vault_policy_document.dr_secondary_promotion.hcl
}

resource "vault_token_auth_backend_role" "failover_handler" {
  role_name        = "failover-handler"
  allowed_policies = ["dr-secondary-promotion"]
  orphan           = true
  renewable        = false
  # token_ttl        = "86400"
  token_type = "batch"
}
