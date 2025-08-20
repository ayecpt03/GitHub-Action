terraform {
  backend "azurerm" {
    resource_group_name   = "CoreServices"
    storage_account_name  = "coreservicestfstatefiles"
    container_name        = "tfstate"
    key                   = "cert.terraform.tfstate" # change per env: dev/test/prod
  }
}
