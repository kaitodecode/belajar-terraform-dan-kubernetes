provider "kubernetes" {
  host = var.kube_host
  token = var.kube_token
  insecure = true
}

module "infrastructure_namespace" {
  source = "../../modules/namespace"
  kube_namespace = "infrastructure"
}

module "nginx" {
  source = "../../services/nginx"
  namespace = module.infrastructure_namespace.name
}