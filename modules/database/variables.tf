variable "resource_group" {}
variable "location" {}
variable "db_password" {
  sensitive = true
}
