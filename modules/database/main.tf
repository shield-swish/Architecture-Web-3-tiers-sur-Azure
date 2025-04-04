resource "azurerm_mysql_flexible_server" "db" {
  name                   = "webappdb-byron01"
  resource_group_name    = var.resource_group
  location               = var.location
  administrator_login    = "mysqladmin"
  administrator_password = var.db_password
  sku_name               = "B_Standard_B1ms"

  version                = "8.0.21"
  storage {
    size_gb = 20
  }
  zone                   = "1"
}

resource "azurerm_mysql_flexible_server_firewall_rule" "allow_all" {
  name                = "AllowAll"
  server_name         = azurerm_mysql_flexible_server.db.name
  resource_group_name = var.resource_group
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "255.255.255.255"
}
