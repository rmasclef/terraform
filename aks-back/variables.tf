variable "client_id" {
  default = "2b51d69a-c48d-4354-bf8a-716c5c500895"
}
variable "client_secret" {
  default = "kMghEKVZwthIIFCBcg29meub/G2UX9jFBt0ARqZA7uE="
}
variable "subscription_id" {
  default = "9ead30ea-ea67-43b5-b0c1-e36bb3f9b6e9"
}

variable "agent_count" {
  default = 3
}

variable "ssh_public_key" {
  default = "~/.ssh/id_rsa.pub"
}

variable "dns_prefix" {
  default = "k8stest"
}

variable cluster_name {
  default = "k8stest"
}

variable resource_group_name {
  default = "RG_UAT_BACK_TEST"
}

variable location {
  default = "North Europe"
}

variable "spiders_node_count" {
  default = 1
}
variable "spiders_max_pods" {
  default = 150
}
variable "spiders_os_disk_size" {
  default = 60
}

variable "microservice_node_count" {
  default = 1
}
variable "microservice_max_pods" {
  default = 150
}
variable "microservice_os_disk_size" {
  default = 60
}
