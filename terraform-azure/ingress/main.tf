provider "kubernetes" {
  config_path = var.aks_kubeconfig
}

resource "kubernetes_namespace" "ingress" {
  metadata {
    name = "ingress-nginx"
  }
}

resource "helm_release" "ingress_controller" {
  name      = "ingress-nginx"
  namespace = kubernetes_namespace.ingress.metadata[0].name
  chart     = "ingress-nginx"
  repository = "https://kubernetes.github.io/ingress-nginx"

  depends_on = [var.aks_kubeconfig]
}

resource "kubernetes_ingress" "argocd" {
  metadata {
    name      = "argocd-ingress"
    namespace = helm_release.argocd.metadata[0].namespace
  }

  spec {
    rule {
      host = "argocd.example.com"

      http {
        path {
          backend {
            service {
              name = "argocd-server"
              port {
                number = 80
              }
            }
          }
        }
      }
    }
  }

  depends_on = [helm_release.argocd, helm_release.ingress_controller]
}
