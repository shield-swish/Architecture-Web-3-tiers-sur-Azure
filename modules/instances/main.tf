resource "azurerm_network_security_group" "frontend_nsg" {
  name                = "frontend-nsg"
  location            = var.location
  resource_group_name = var.resource_group

  security_rule {
    name                       = "AllowHTTP"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_network_interface_security_group_association" "frontend_nic_nsg" {
  network_interface_id      = azurerm_network_interface.frontend_nic.id
  network_security_group_id = azurerm_network_security_group.frontend_nsg.id
}

resource "azurerm_public_ip" "frontend_ip" {
  name                = "frontend-public-ip"
  location            = var.location
  resource_group_name = var.resource_group
  allocation_method   = "Static"
  sku                 = "Basic"
}

resource "azurerm_network_interface" "frontend_nic" {
  name                = "frontend-nic"
  location            = var.location
  resource_group_name = var.resource_group

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.frontend_subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.frontend_ip.id
  }
}

resource "azurerm_linux_virtual_machine" "frontend_vm" {
  name                  = "frontend-vm"
  resource_group_name   = var.resource_group
  location              = var.location
  size                  = "Standard_B1s"
  admin_username        = "azureuser"
  network_interface_ids = [azurerm_network_interface.frontend_nic.id]
  admin_password        = var.admin_password
  disable_password_authentication = false

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

    os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    name                 = "frontend-osdisk"
  }

  custom_data = base64encode(file("${path.module}/init-web.sh"))
}


