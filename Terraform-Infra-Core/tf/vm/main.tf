# # Folder: tf/vm/main.tf

# Create a resource group
resource "azurerm_resource_group" "tf-rg1" {
  name     = var.resource_group_name
  location = var.location
  tags = {
    environment = var.stage
  }
}

# Create a virtual network within the resource group
resource "azurerm_virtual_network" "tf-vnet1" {
  name                = var.vnet_name
  resource_group_name = azurerm_resource_group.tf-rg1.name
  location            = azurerm_resource_group.tf-rg1.location
  address_space       = ["10.123.0.0/16"]

  tags = {
    environment = var.stage
  }
}

resource "azurerm_subnet" "tf-subnet1" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.tf-rg1.name
  virtual_network_name = azurerm_virtual_network.tf-vnet1.name
  address_prefixes     = ["10.123.1.0/24"]

}

resource "azurerm_network_security_group" "tf-nsg1" {
  name                = var.nsg_name
  location            = azurerm_resource_group.tf-rg1.location
  resource_group_name = azurerm_resource_group.tf-rg1.name

  tags = {
    environment = var.stage
  }
}

resource "azurerm_network_security_rule" "tf-sgrule1" {
  name                        = var.sgrule_name
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.tf-rg1.name
  network_security_group_name = azurerm_network_security_group.tf-nsg1.name
}

resource "azurerm_subnet_network_security_group_association" "tf-sgassoc1" {
  subnet_id                 = azurerm_subnet.tf-subnet1.id
  network_security_group_id = azurerm_network_security_group.tf-nsg1.id
}

