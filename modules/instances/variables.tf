variable "resource_group" {}
variable "location" {}
variable "frontend_subnet_id" {}
variable "admin_password" {
  sensitive = true
}
