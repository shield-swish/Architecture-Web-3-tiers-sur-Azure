variable "location" {
  type    = string
  default = "East US"
}

variable "azurerm_resource_group" {
  type    = string
  default = "1-92900e96-playground-sandbox"
}

variable "admin_password" {
  description = "Admin password for the virtual machines"
  sensitive   = true
  type        = string
}

variable "db_password" {
  description = "Password for the MySQL database"
  sensitive   = true
  type        = string
}