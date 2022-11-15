parent_namespace     = "acme/suborg1/uat"
prefix               = "uat"
grp                  = "acars"
role                  = "svc1"
auth_type            = "approle"
create_app_kv_secret = true
app_group_membership = [
  "templated-kv-role-read",
]
