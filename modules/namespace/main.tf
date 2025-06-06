resource "kubernetes_namespace" "this" {
  metadata {
    name = var.kube_namespace
  }
}