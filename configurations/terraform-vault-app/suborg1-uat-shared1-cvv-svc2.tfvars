parent_namespace       = "acme/suborg1/uat/uat-shared1"
prefix                 = "uat"
grp                    = "cvv"
shared_group_namespace = "uat-shared_key1"
app                    = "svc2"
auth_type              = "approle"
create_app_kv_secret   = true
app_group_membership = [
  "templated-kv-app-read",
]
shared_group_membership = [
  "shared-transit-grp-full"
]
tls_role_ca_cert = <<-EOT
-----BEGIN CERTIFICATE-----
MIIDXDCCAkSgAwIBAgIJAJfSZmGoUvNZMA0GCSqGSIb3DQEBCwUAMDsxGzAZBgNV
BAMMEk15IFByaXZhdGUgVGVzdCBDQTELMAkGA1UEBhMCR0IxDzANBgNVBAcMBkxv
bmRvbjAeFw0yMjAxMTMxNDAyMDBaFw0yNzAxMTIxNDAyMDBaMDsxGzAZBgNVBAMM
Ek15IFByaXZhdGUgVGVzdCBDQTELMAkGA1UEBhMCR0IxDzANBgNVBAcMBkxvbmRv
bjCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMKcafNuVY5kVrpiYYl6
vT2uB045pD2rVr9y0hCk3viQZwh0Xz3BvMbQxYPVD+dtSMZRQIYRSKLKu7hChVFl
traW9QMO6IVYIkYXDrD+SHW2nLeZKc/tz8e4wddGSJWp1Sd1wFi+rwbNdtOxamfD
D9aroT74kMy+Unuefu4TKiGfvoV/uFPXKwFyS7t6ZAQnrO71qkejvpu9N5UwLgD9
sOK4ppYpay1pamOqRm+q6ifZ3eq/u8+0xR2ei6qjkDb2zpTo2JsS8rgxLTR4fsMx
N8/GaN6Y7dhz05teeRD/Ty6WgdM8sRWb31dXrfZWBIT6JFd6l1x/ZSeqA/az0w5I
ltcCAwEAAaNjMGEwHQYDVR0OBBYEFCKswMrRghLOvZIn5n2eeQmkff4fMB8GA1Ud
IwQYMBaAFCKswMrRghLOvZIn5n2eeQmkff4fMA8GA1UdEwEB/wQFMAMBAf8wDgYD
VR0PAQH/BAQDAgGGMA0GCSqGSIb3DQEBCwUAA4IBAQCUSR/+v6bKv6aljE/916vu
A9WPit5ah4CSfD5DbxXG1AVsHmnP3eAggvTQjl5Mu6bfp4AXfHhsd55H+/suZ6Lz
xWY9RDZXxAu3nWL3Vy8RGQi9njafYYtk0c5Z38wicSzdB3hyx07snxgHfbkna+JS
ytZKoWXYfVchkwzICKCa44cOvjfuaSdV4ujyQA1a3omhVDQJWRCDC/gaybzjkSsX
Buy6NPRtpmx63+tFZVZMSYQskvyzYnSZq6xrgwSml87uTyMpHSQ9R554DRL5Flfq
Ek4QEfVz4G5m8ykkSEYlUujkHrPf1slU7s80Y0NBpBrHB0BI/cgtb9H5O/QieDkN
-----END CERTIFICATE-----
EOT


