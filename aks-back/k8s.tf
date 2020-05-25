//resource "azurerm_resource_group" "k8s-back" {
//  name = var.resource_group_name
//  location = var.location
//}

//resource "random_id" "log_analytics_workspace_name_suffix" {
//  byte_length = 8
//}

resource "azurerm_kubernetes_cluster" "k8s-back" {
  name = var.cluster_name
  location = var.location
  resource_group_name = var.resource_group_name
  dns_prefix = var.dns_prefix

  linux_profile {
    admin_username = "ubuntu"

    ssh_key {
      key_data = file(var.ssh_public_key)
    }
  }

  default_node_pool {
    name = "agentpool"
    node_count = var.agent_count
    vm_size = "Standard_DS1_v2"
    type = "VirtualMachineScaleSets"
    vnet_subnet_id = "/subscriptions/"+var.subscription_id+"/resourceGroups/RG_INFRA/providers/Microsoft.Network/virtualNetworks/VNET_INFRA_REEZOCAR/subnets/SUB_UAT"
  }

  service_principal {
    client_id = var.client_id
    client_secret = var.client_secret
  }

  role_based_access_control {
    enabled = false
  }

  network_profile {
    network_plugin = "azure"
    dns_service_ip = "10.10.0.10"
    docker_bridge_cidr = "172.17.0.1/16"
    service_cidr = "10.10.0.0/16"
  }


  tags = {
    Environment = "Development"
  }
}

resource "azurerm_kubernetes_cluster_node_pool" "k8s-back-spiders" {
  name = "spiders"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.k8s-back.id
  vm_size = "Standard_F4s_v2"
  node_count = var.spiders_node_count
  max_pods = var.spiders_max_pods
  os_disk_size_gb = var.spiders_os_disk_size

  tags = {
    Environment = "Development"
  }
}

resource "azurerm_kubernetes_cluster_node_pool" "k8s-back-spiders" {
  name = "microservice"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.k8s-back.id
  vm_size = "Standard_E4s_v3"
  node_count = var.microservice_node_count
  max_pods = var.microservice_max_pods
  os_disk_size_gb = var.microservice_os_disk_size

  tags = {
    Environment = "Development"
  }
}
