
# Allow tokens to look up their own properties
path "${namespace}/auth/token/lookup-self" {
    capabilities = ["read"]
}

# Allow a token to look up its own capabilities on a path
path "${namespace}/sys/capabilities-self" {
    capabilities = ["update"]
}

# List namespaces
path "${namespace}/sys/namespaces" {
  capabilities = ["list"]
}

# Create and manage namespaces
path "${namespace}/sys/namespaces/*" {
  capabilities = ["create", "delete", "list", "patch", "read", "update"]
}

# Create and manage identities (including Vault's OIDC provider and MFA)
path "${namespace}/identity/*" {
  capabilities = ["create", "delete", "list", "read", "update"]
}

# List existing ACL policies
path "${namespace}/sys/policies/acl" {
  capabilities = ["list"]
}

# Create and manage ACL policies
path "${namespace}/sys/policies/acl/*" {
  capabilities = ["create", "delete", "read", "update"]
}

# List existing Sentinel EGP policies
path "${namespace}/sys/policies/egp" {
  capabilities = ["list"]
}

# Manage EGP Sentinel policies
path "${namespace}/sys/policies/egp/*" {
  capabilities = ["create", "delete", "read", "update"]
}

# List existing Sentinel RGP policies
path "${namespace}/sys/policies/rgp" {
  capabilities = ["list"]
}

# Manage RGP Sentinel policies
path "${namespace}/sys/policies/rgp/*" {
  capabilities = ["create", "delete", "read", "update"]
}

# Manage auth methods broadly across Vault
path "${namespace}/auth/*" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# List auth methods
path "${namespace}/sys/auth" {
  capabilities = ["read"]
}

# Manage auth methods
path "${namespace}/sys/auth/*" {
  capabilities = ["create", "delete", "read", "sudo", "update"]
}

# List secrets engines.
path "${namespace}/sys/mounts" {
  capabilities = ["read"]
}

# Manage secrets engines.
path "${namespace}/sys/mounts/*" {
  capabilities = ["create", "delete", "list", "read", "update"]
}


// path "${namespace}/auth/jwt/*" {
//   capabilities = ["create", "delete", "list", "read", "update"]
// }

// path "${namespace}/auth/kubernetes/*" {
//   capabilities = ["create", "delete", "list", "read", "update"]
// }

// path "${namespace}/auth/ldap/*" {
//   capabilities = ["create", "delete", "list", "read", "update"]
// }

// path "${namespace}/auth/oidc/*" {
//   capabilities = ["create", "delete", "list", "read", "update"]
// }

path "${namespace}/cubbyhole/*" {
  capabilities = ["create", "delete", "list", "read", "update"]
}

path "${namespace}/+" {
  capabilities = ["list", "read"]
}
