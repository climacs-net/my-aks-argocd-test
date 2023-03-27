output "argo_cd_endpoint" {
  value       = kubernetes_ingress.argocd.status[0].load_balancer.ingress[0].ip
  description = "ArgoCD ingress endpoint"
}
