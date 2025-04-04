output "frontend_ip" {
  value = azurerm_network_interface.frontend_nic.private_ip_address
}

output "frontend_public_ip" {
  value = azurerm_public_ip.frontend_ip.ip_address
}