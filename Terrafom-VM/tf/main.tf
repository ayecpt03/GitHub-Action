terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

provider "azurerm" {
  features {}
}


module "vm" {
  source              = "./vm"
  resource_group_name = var.resource_group_name
  location            = var.location
  vnet_name           = var.vnet_name
  subnet_name         = var.subnet_name
  nsg_name            = var.nsg_name
  sgrule_name         = var.sgrule_name
  nic_name            = var.nic_name
  ipconfig_name       = var.ipconfig_name
  tags                = var.tags
  ssh_public_key      = var.ssh_public_key
  #custom_data_file    = var.custom_data_file
  stage = var.stage
  vms   = var.vms
}