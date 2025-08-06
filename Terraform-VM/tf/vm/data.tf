# This is where we need to get all value from locals


data "azurerm_resource_group" "tf-rg1" {
  name = var.resource_group_name
}

data "azurerm_virtual_network" "tf-vnet1" {
  name                = var.vnet_name
  resource_group_name = var.resource_group_name
}

data "azurerm_subnet" "tf-subnet1" {
  name                 = var.subnet_name
  virtual_network_name = var.vnet_name
  resource_group_name  = var.resource_group_name
}

data "azurerm_network_security_group" "tf-nsg1" {
  name                = var.nsg_name
  resource_group_name = var.resource_group_name
}
