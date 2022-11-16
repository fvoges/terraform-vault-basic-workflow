parent_namespace     = "acme/bu1"
auth_namespace       = "acme/bu1"
prefix               = "bu1"
grp                  = "gt"
role                 = "svc1"
auth_type            = "approle"
create_app_kv_secret = true
app_group_membership = [
  "templated-kv-role-read",
]
