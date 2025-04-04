resource "azurerm_resource_group" "rg" {
  name     = var.azurerm_resource_group
  location = var.location
}


module "network" {
  source          = "./modules/network"
  resource_group  = azurerm_resource_group.rg.name
  location        = var.location
}

 module "compute" {
   source            = "./modules/instances"
   resource_group    = azurerm_resource_group.rg.name
   location          = var.location
   frontend_subnet_id = module.network.frontend_subnet_id
   admin_password    = var.admin_password
 }

 module "database" {
   source          = "./modules/database"
   resource_group  = azurerm_resource_group.rg.name
   location        = var.location
   db_password     = var.db_password 
}
