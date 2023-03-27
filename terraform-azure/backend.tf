terraform {
  backend "azurerm" {
    resource_group_name  = "myResourceGroup"
    storage_account_name = "myStorageAccount"
    container_name       = "myContainer"
    key                  = "terraform.tfstate"
  }
}
