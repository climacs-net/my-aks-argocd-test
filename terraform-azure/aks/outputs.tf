output "cluster_name" {
  value       = azurerm_kubernetes_cluster.this.name
  description = "AKS cluster name"
}

output "kubeconfig" {
  value       = azurerm_kubernetes_cluster.this.kube_config_raw
  description = "AKS cluster kubeconfig"
}

