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