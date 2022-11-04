locals {
  mfa_settings_file   = var.mfa_settings_file
  mfa_username_format = var.mfa_username_format
  # mfa_username_format  = format("{{identity.entity.aliases.%s.name}}", module.oidc_auth[0].oidc_auth_mount_accessor)
  mfa_enforcement_name = var.mfa_enforcement_name

}
module "mfa_pingid" {
  source          = "../../modules/terraform-vault-mfa/modules/mfa_pingid"
  namespace       = local.namespace
  settings_file   = local.mfa_settings_file
  username_format = local.mfa_username_format
  mount_accessor  = module.oidc_auth[0].oidc_auth_mount_accessor
}

# module "mfa_pingid" {
#   source          = "../../modules/terraform-vault-identity_mfa/modules/identity_mfa_pingid"
#   namespace       = local.namespace
#   settings_file   = local.mfa_settings_file
#   username_format = local.mfa_username_format
# }

# module "mfa_enforcement" {
#   source                = "../../modules/terraform-vault-identity_mfa/modules/identity_mfa_login_enforcement"
#   namespace             = local.namespace
#   name                  = "pingid_oidc_mfa_enforcement"
#   mfa_method_ids        = [module.mfa_pingid.mfa_pingid.method_id]
#   auth_method_accessors = [module.oidc_auth[0].oidc_auth_mount_accessor]
# }
