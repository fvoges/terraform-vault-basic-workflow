
# Allow tokens to look up their own properties
path "${var.namespace}/auth/token/lookup-self" {
    capabilities = ["read"]
}

# Allow a token to look up its own capabilities on a path
path "${var.namespace}/sys/capabilities-self" {
    capabilities = ["update"]
}

# List namespaces
path "${var.namespace}/sys/namespaces" {
  capabilities = ["list"]
}

# Create and manage namespaces
path "${var.namespace}/sys/namespaces/*" {
  capabilities = ["create", "delete", "list", "patch", "read", "update"]
}

# Create and manage identities (including Vault's OIDC provider and MFA)
path "${var.namespace}/identity/*" {
  capabilities = ["create", "delete", "list", "read", "update"]
}

# List existing ACL policies
path "${var.namespace}/sys/policies/acl" {
  capabilities = ["list"]
}

# Create and manage ACL policies
path "${var.namespace}/sys/policies/acl/*" {
  capabilities = ["create", "delete", "read", "update"]
}

# List existing Sentinel EGP policies
path "${var.namespace}/sys/policies/egp" {
  capabilities = ["list"]
}

# Manage EGP Sentinel policies
path "${var.namespace}/sys/policies/egp/*" {
  capabilities = ["create", "delete", "read", "update"]
}

# List existing Sentinel RGP policies
path "${var.namespace}/sys/policies/rgp" {
  capabilities = ["list"]
}

# Manage RGP Sentinel policies
path "${var.namespace}/sys/policies/rgp/*" {
  capabilities = ["create", "delete", "read", "update"]
}

# Manage auth methods broadly across Vault
path "${var.namespace}/auth/*" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# List auth methods
path "${var.namespace}/sys/auth" {
  capabilities = ["read"]
}

# Manage auth methods
path "${var.namespace}/sys/auth/*" {
  capabilities = ["create", "delete", "read", "sudo", "update"]
}

# List secrets engines.
path "${var.namespace}/sys/mounts" {
  capabilities = ["read"]
}

# Manage secrets engines.
path "${var.namespace}/sys/mounts/*" {
  capabilities = ["create", "delete", "list", "read", "update"]
}


// path "${var.namespace}/auth/jwt/*" {
//   capabilities = ["create", "delete", "list", "read", "update"]
// }

// path "${var.namespace}/auth/kubernetes/*" {
//   capabilities = ["create", "delete", "list", "read", "update"]
// }

// path "${var.namespace}/auth/ldap/*" {
//   capabilities = ["create", "delete", "list", "read", "update"]
// }

// path "${var.namespace}/auth/oidc/*" {
//   capabilities = ["create", "delete", "list", "read", "update"]
// }
