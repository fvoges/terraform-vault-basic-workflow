
# Allow tokens to look up their own properties
path "${namespace}/auth/token/lookup-self" {
    capabilities = ["read"]
}

# Allow a token to look up its own capabilities on a path
path "${namespace}/sys/capabilities-self" {
    capabilities = ["update"]
}
# Create and manage namespaces
path "${namespace}/sys/namespaces" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

# Create and manage namespaces
path "${namespace}/sys/namespaces/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

# Create and manage identities
path "${namespace}/identity/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
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

# Create, update, and delete auth methods
path "${namespace}/sys/auth/*" {
  capabilities = ["create", "update", "delete", "sudo"]
}

# List auth methods
path "${namespace}/sys/auth" {
  capabilities = ["read"]
}

# List existing secrets engines.
path "${namespace}/sys/mounts" {
  capabilities = ["read"]
}

# Manage secrets engines
path "${namespace}/sys/mounts/*" {
  capabilities = ["create", "delete", "read", "update"]
}

# # Configure AWS secrets engine
# path "${namespace}/aws/config/*" {
#   capabilities = ["create", "delete", "read", "update"]
# }

# # List AWS secrets engine roles
# path "${namespace}/aws/roles" {
#   capabilities = ["list", "read"]
# }

# # Configure AWS secrets engine roles
# path "${namespace}/aws/roles/*" {
#   capabilities = ["create", "delete", "list", "read", "update"]
# }

# Admins should not really need these
## Generate AWS credentials
#path "${namespace}/creds/*" {
#  capabilities = ["read"]
#}
#
#path "${namespace}/sts/*" {
#  capabilities = ["create","update"]
#}

# Configure Kubernetes secrets engine
path "${namespace}/kubernetes/config" {
  capabilities = ["create", "delete", "read", "update"]
}

# List Kubernetes secrets engine roles
path "${namespace}/kubernetes/roles" {
  capabilities = ["list", "read"]
}

# Configure Kubernetes secrets engine roles
path "${namespace}/kubernetes/roles/*" {
  capabilities = ["create", "delete", "list", "read", "update"]
}

# Generate Kubernetes secrets engine credentials
# path "${namespace}/kubernetes/creds/*" {
#   capabilities = ["create", "update"]
# }

path "${namespace}/auth/kubernetes/*" {
  capabilities = ["create", "delete", "list", "read", "update"]
}

path "${namespace}/auth/jwt/*" {
  capabilities = ["create", "delete", "list", "read", "update"]
}

path "${namespace}/kv/*" {
  capabilities = ["create", "delete", "list", "patch", "read", "update"]
}

# List database secrets engine connections
path "${namespace}/database/config" {
  capabilities = ["list"]
}

# Configure database secrets engine connection
path "${namespace}/database/config/*" {
  capabilities = ["create", "delete", "read", "update"]
}

# List database secrets engine roles
path "${namespace}/database/roles" {
  capabilities = ["list"]
}

# Configure database secrets engine roles
path "${namespace}/database/roles/*" {
  capabilities = ["create", "delete", "read", "update"]
}

# List static database roles
path "${namespace}/database/static-roles" {
 capabilities = ["list"]
}

# Create/update static database roles
path "${namespace}/database/static-roles/*" {
 capabilities = ["create", "delete", "read", "update"]
}

# # Retrieve static database credentials
# path "${namespace}/database/static-creds/*" {
#  capabilities = ["read"]
# }

# For testing only
path "${namespace}/database/*" {
  capabilities = ["create", "delete", "list", "read", "update"]
}

# # Retrieve static database credentials
# path "${namespace}/database/static-creds/*" {
#  capabilities = ["read"]
# }

# # Admins should not really need these
# # Generate database credentials
# path "${namespace}/database/creds/*" {
#  capabilities = ["read"]
# }
