provider "azurerm" {
  features {}
}

resource "azurerm_kubernetes_cluster" "this" {
  name                = "myAKSCluster"
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "myAKS"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_DS2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Terraform = "true"
    Module    = "aks"
  }
}
