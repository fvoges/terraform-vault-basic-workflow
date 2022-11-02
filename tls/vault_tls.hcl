listener "tcp" {
  address = "127.0.0.1:8201"
  tls_disable   = false
  tls_cert_file = "tls/simple-ca/certs/vault.local.crt"
  tls_key_file  = "tls/simple-ca/certs/vault.local.key"
  # tls_disable_client_certs = true
}
