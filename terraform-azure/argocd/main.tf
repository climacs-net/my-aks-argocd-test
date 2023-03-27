provider "helm" {
  kubernetes {
    config_path = var.aks_kubeconfig
  }
}

resource "helm_release" "argocd" {
  name       = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"

  set {
    name  = "installCRDs"
    value = "false"
  }

  set {
    name  = "server.ingress.enabled"
    value = "false"
  }

  depends_on = [var.aks_kubeconfig]
}
