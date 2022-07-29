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
variable "creation_statement" {
  type        = list(string)
  description = "MongoDB Atlas secrets engine role creation statement. This defines how to create the user and which permissions it has. Provided by your MongoDB admins."
}
