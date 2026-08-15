output "cluster_name" {
  value = azurerm_kubernetes_cluster.aks.name
  description = "The name of the kubernetes cluster"
}
output "cluster_id" {
  value = azurerm_kubernetes_cluster.aks.id
  description = "The ID of the kubernetes cluster"
}
output "identity_object_id" {
  value = azurerm_kubernetes_cluster.aks.identity[0].principal_id
  description = "The object ID of the managed identity for the kubernetes cluster"
}
output "oidc_issuer_url" {
  value = azurerm_kubernetes_cluster.aks.oidc_issuer_url
  description = "The OIDC issuer URL for the kubernetes cluster"
}
output "node_resource_group" {
  value = azurerm_kubernetes_cluster.aks.node_resource_group
  description = "The name of the resource group containing the kubernetes cluster nodes"
}
output "kube_config_raw" {
  value = azurerm_kubernetes_cluster.aks.kube_config_raw
  description = "The raw kube config for the kubernetes cluster"
  sensitive = true
}