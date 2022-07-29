variable "role_name" {
  type        = string
  description = "Mongodb Atlas role name to create."
  default     = "mongodb"
}
variable "mount_path" {
  type        = string
  description = "MongoDB Atlas secrets engine mount path."
  default     = "mongodb"
}
variable "mount_name" {
  type        = string
  description = "MongoDB Atlas secrets engine mount name."
  default     = "mongodb"
}
variable "public_key" {
  type        = string
  description = "Mongodb Atlas API public key."
}
variable "private_key" {
  type        = string
  description = "Mongodb Atlas API private key."
  sensitive   = true
}
variable "project_id" {
  type        = string
  description = "Mongodb Atlas project ID."
}
