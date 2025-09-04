resource "azurerm_resource_group" "rg2" {
  name     = "vinod-rg-test1"
  location = "central india"
  tags = {
      Environment = "dev"
      Owner       = "vinod"
    }
}

resource "azurerm_resource_group" "rg5" {
  name     = "vinod-rg-use"
  location = "Canada Central"
  tags = {
      Environment = "dev"
      Owner       = "vinod"
    }
}

resource "azurerm_virtual_network" "vnet1" {
  name                = "canada-vinod-vnet"
  address_space       = ["10.0.0.0/20"]
  location            = azurerm_resource_group.rg5.location
  resource_group_name = azurerm_resource_group.rg5.name
}

resource "azurerm_subnet" "subnet1" {
  name                 = "canada-vinodsubnet"
  resource_group_name  = azurerm_resource_group.rg5.name
  virtual_network_name = azurerm_virtual_network.vnet1.name
  address_prefixes     = ["10.0.2.0/28"]
}

resource "azurerm_network_interface" "nic1" {
  name                = "vinod-nic1"
  location            = azurerm_resource_group.rg5.location
  resource_group_name = azurerm_resource_group.rg5.name

  ip_configuration {
    name                          = "vinodvm1-internal"
    subnet_id                     = azurerm_subnet.subnet1.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                = "vinod-vm1"
  resource_group_name = azurerm_resource_group.rg5.name
  location            = azurerm_resource_group.rg5.location
  size                = "Standard_F2"
  admin_username      = "vinodadmin"
  admin_password      = "Vinodadmin123!"
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.nic1.id,
  ]

   

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}