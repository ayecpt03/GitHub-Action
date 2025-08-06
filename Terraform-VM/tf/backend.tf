# This is where we want to save the terraformtf.state file
terraform {
  required_version = ">= 1.3.0"

  backend "local" {
    path = "terraform.tfstate"
  }
}
