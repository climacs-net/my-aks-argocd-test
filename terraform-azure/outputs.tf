output "aks_cluster_name" {
  value       = module.aks.cluster_name
  description = "AKS cluster name"
}

output "argo_cd_endpoint" {
  value       = module.ingress.argo_cd_endpoint
  description = "ArgoCD ingress endpoint"
}
