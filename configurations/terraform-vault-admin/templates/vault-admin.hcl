# Read system health check
path "sys/health" {
  capabilities = ["read", "sudo"]
}

# Manage Audit devices
path "sys/audit" {
  capabilities = ["read", "sudo"]
}

# Manage Audit devices
path "sys/audit/*" {
  capabilities = ["create", "delete", "sudo", "update"]
}

# List namespaces
path "sys/namespaces" {
  capabilities = ["list"]
}

# Create and manage namespaces
path "sys/namespaces/*" {
  capabilities = ["create", "delete", "list", "read", "update"]
}

# Create and manage identities
path "identity/*" {
  capabilities = ["create", "delete", "list", "read", "update"]
}

# List ACL policies
path "sys/policies/acl" {
  capabilities = ["list"]
}

# Create and manage ACL policies
path "sys/policies/acl/*" {
  capabilities = ["create", "delete", "read", "update"]
}

# List Sentinel EGP policies
path "sys/policies/egp" {
  capabilities = ["list"]
}

# Manage EGP Sentinel policies
path "sys/policies/egp/*" {
  capabilities = ["create", "delete", "read", "update"]
}

# List Sentinel RGP policies
path "sys/policies/rgp" {
  capabilities = ["list"]
}

# Manage RGP Sentinel policies
path "sys/policies/rgp/*" {
  capabilities = ["create", "delete", "read", "update"]
}

# Manage auth methods broadly across Vault
path "auth/*" {
  capabilities = ["create", "delete", "list", "read", "sudo", "update"]
}

# Manage auth methods
path "sys/auth/*" {
  capabilities = ["create", "delete", "sudo", "update"]
}

# List auth methods
path "sys/auth" {
  capabilities = ["read"]
}

# List  secrets engines.
path "sys/mounts" {
  capabilities = ["read"]
}

# Manage secrets engines
path "sys/mounts/*" {
  capabilities = ["create", "delete", "read", "update"]
}

# Manage Replication
path "sys/replication/*" {
  capabilities = ["create", "delete", "list", "read", "sudo", "update"]
}

# Manage Raft
path "sys/storage/raft/*" {
  capabilities = ["create", "delete", "list", "read", "sudo", "update"]
}

# Encryption Key Rotation
path "sys/rotate" {
  capabilities = ["create", "update", "sudo"]
}

# Automated Encryption Key Rotation Configuration
path "sys/rotate/config" {
  capabilities = ["create", "read", "update"]
}

# Get Encryption Key Status
path "sys/key-status" {
  capabilities = ["read"]
}
