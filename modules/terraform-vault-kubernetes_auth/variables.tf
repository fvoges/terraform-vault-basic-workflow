# variable "prefix" {
#   type= string
#   description = "Application prefix. Normally used for the environment name (e.g., prod, qa, uat, dev, etc.)"
# }

# variable "grp" {
#   type = string
#   description = "Application group name"
# }

variable "k8s_api_url" {
  type        = string
  description = "Kubernetes API URL"
}

variable "k8s_ca_cert" {
  type        = string
  description = "Kubernetes CA certificate"
}

variable "k8s_token_reviewer_jwt" {
  type        = string
  description = "Kubernetes JWT reviewer token"
}
