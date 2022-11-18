
# Allow tokens to look up their own properties
path "${namespace}/auth/token/lookup-self" {
    capabilities = ["read"]
}

# Allow a token to look up its own capabilities on a path
path "${namespace}/sys/capabilities-self" {
    capabilities = ["update"]
}

// # List namespaces
// path "${namespace}/sys/namespaces" {
//   capabilities = ["list"]
// }

path "${namespace}/cubbyhole/*" {
  capabilities = ["create", "delete", "list", "read", "update"]
}

path "${namespace}/+" {
  capabilities = ["list", "read"]
}
