terraform {
  backend "azurerm" {
    resource_group_name = "credprojrg"
    storage_account_name = "credpaystate"
    container_name     = "statefile"
    key                = "terraform.tfstate"
  }
}