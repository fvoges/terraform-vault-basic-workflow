
# Allow tokens to look up their own properties
path "${var.namespace}/auth/token/lookup-self" {
    capabilities = ["read"]
}

# Allow a token to look up its own capabilities on a path
path "${var.namespace}/sys/capabilities-self" {
    capabilities = ["update"]
}
# Create and manage namespaces
path "${var.namespace}/sys/namespaces" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

# Create and manage namespaces
path "${var.namespace}/sys/namespaces/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

# Create and manage identities
path "${var.namespace}/identity/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
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

# Create, update, and delete auth methods
path "${var.namespace}/sys/auth/*" {
  capabilities = ["create", "update", "delete", "sudo"]
}

# List auth methods
path "${var.namespace}/sys/auth" {
  capabilities = ["read"]
}

# List existing secrets engines.
path "${var.namespace}/sys/mounts" {
  capabilities = ["read"]
}

# Manage secrets engines
path "${var.namespace}/sys/mounts/*" {
  capabilities = ["create", "delete", "read", "update"]
}

# # Configure AWS secrets engine
# path "${var.namespace}/aws/config/*" {
#   capabilities = ["create", "delete", "read", "update"]
# }

# # List AWS secrets engine roles
# path "${var.namespace}/aws/roles" {
#   capabilities = ["list", "read"]
# }

# # Configure AWS secrets engine roles
# path "${var.namespace}/aws/roles/*" {
#   capabilities = ["create", "delete", "list", "read", "update"]
# }

# Admins should not really need these
## Generate AWS credentials
#path "${var.namespace}/creds/*" {
#  capabilities = ["read"]
#}
#
#path "${var.namespace}/sts/*" {
#  capabilities = ["create","update"]
#}

# Configure Kubernetes secrets engine
path "${var.namespace}/kubernetes/config" {
  capabilities = ["create", "delete", "read", "update"]
}

# List Kubernetes secrets engine roles
path "${var.namespace}/kubernetes/roles" {
  capabilities = ["list", "read"]
}

# Configure Kubernetes secrets engine roles
path "${var.namespace}/kubernetes/roles/*" {
  capabilities = ["create", "delete", "list", "read", "update"]
}

# Generate Kubernetes secrets engine credentials
# path "${var.namespace}/kubernetes/creds/*" {
#   capabilities = ["create", "update"]
# }

path "${var.namespace}/auth/kubernetes/*" {
  capabilities = ["create", "delete", "list", "read", "update"]
}

path "${var.namespace}/auth/jwt/*" {
  capabilities = ["create", "delete", "list", "read", "update"]
}

path "${var.namespace}/kv/*" {
  capabilities = ["create", "delete", "list", "patch", "read", "update"]
}

# List database secrets engine connections
path "${var.namespace}/database/config" {
  capabilities = ["list"]
}

# Configure database secrets engine connection
path "${var.namespace}/database/config/*" {
  capabilities = ["create", "delete", "read", "update"]
}

# List database secrets engine roles
path "${var.namespace}/database/roles" {
  capabilities = ["list"]
}

# Configure database secrets engine roles
path "${var.namespace}/database/roles/*" {
  capabilities = ["create", "delete", "read", "update"]
}

# List static database roles
path "${var.namespace}/database/static-roles" {
 capabilities = ["list"]
}

# Create/update static database roles
path "${var.namespace}/database/static-roles/*" {
 capabilities = ["create", "delete", "read", "update"]
}

# # Retrieve static database credentials
# path "${var.namespace}/database/static-creds/*" {
#  capabilities = ["read"]
# }

# For testing only
path "${var.namespace}/database/*" {
  capabilities = ["create", "delete", "list", "read", "update"]
}

# # Retrieve static database credentials
# path "${var.namespace}/database/static-creds/*" {
#  capabilities = ["read"]
# }

# # Admins should not really need these
# # Generate database credentials
# path "${var.namespace}/database/creds/*" {
#  capabilities = ["read"]
# }
