output "resource_group_name" {
  value = module.resource_group.name
}
output "vnet_id" {
  value = module.networking.vnet_id
}
output "aks_subnet_id" {
  value = module.networking.subnet_ids["aks"]
}
output "aks_cluster_name" {
  value = module.aks.cluster_name
}
output "aks_resource_group" {
  value = module.resource_group.name
}
output "aks_identity_object_id" {
  description = "Object ID of the AKS cluster managed identity."
  value       = module.aks.identity_object_id
}

output "aks_oidc_issuer_url" {
  description = "OIDC issuer URL (needed for workload identity federation)."
  value       = module.aks.oidc_issuer_url
}

output "aks_node_resource_group" {
  description = "Auto-generated node resource group (MC_...)."
  value       = module.aks.node_resource_group
}

output "get_credentials_command" {
  description = "Convenience command to fetch kubeconfig."
  value       = "az aks get-credentials --resource-group ${module.resource_group.name} --name ${module.aks.cluster_name} --overwrite-existing"
}

output "postgres_server_name" {
  value = module.postgres.server_name
  description = "The name of the PostgreSQL Flexible Server"
}
output "postgres_fqdn" {
  value = module.postgres.fqdn
  description = "The FQDN of the PostgreSQL Flexible Server"
}
output "postgres_database_name" {
  value = module.postgres.database_name
  description = "The name of the PostgreSQL database"
}
output "postgres_admin_username" {
  value = module.postgres.admin_username
  description = "The administrator username for the PostgreSQL Flexible Server"
}
output "postgres_admin_password" {
  value = module.postgres.admin_password
  description = "The administrator password for the PostgreSQL Flexible Server"
  sensitive = true
}
output "log_analytics_workspace_id" {
  value = module.monitoring.workspace_id
  description = "The ID of the Log Analytics Workspace"
}
output "keyvault_name" {
  value = module.keyvault.keyvault_name
  description = "The name of the Key Vault"
}
