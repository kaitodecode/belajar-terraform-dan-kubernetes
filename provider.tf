
variable "kube_host" {
  type = string
  description = "Kubernetes Host"
  sensitive = true
}

variable "kube_token" {
  type = string
  description = "Kubernetes Token"
  sensitive = true
}

provider "kubernetes" {
  host = var.kube_host
  token = var.kube_token
  insecure = true
}

resource "kubernetes_namespace" "belajar" {
  metadata {
    name = "belajar"
  }
}

resource "kubernetes_deployment" "nginx" {
  metadata {
    name = "nginx"
    namespace = kubernetes_namespace.belajar.metadata.0.name
    labels = {
      app = "nginx"
    }
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "nginx"
      }
    }

    template {
      metadata {
        labels = {
          app = "nginx"
        }
      }

      spec {
        container {
          image = "nginx:stable-alpine3.21-perl"
          name = "nginx"
          
          port {
            container_port = 80
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "nginx" {
  metadata {
    name = "nginx-service"
    namespace = kubernetes_namespace.belajar.metadata.0.name
  }

  spec {
    selector = {
      app = "nginx"
    }

    port {
      port = 80
      target_port = 80
    }

    type = "ClusterIP"
  }
}