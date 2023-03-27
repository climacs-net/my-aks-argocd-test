module "aks" {
  source              = "./aks"
  resource_group_name = var.resource_group_name
  location            = var.location
}

module "argocd" {
  source              = "./argocd"
  resource_group_name = var.resource_group_name
  location            = var.location
  aks_kubeconfig      = module.aks.kubeconfig
}

module "ingress" {
  source              = "./ingress"
  resource_group_name = var.resource_group_name
  location            = var.location
  aks_kubeconfig      = module.aks.kubeconfig
}
