locals {
  name_prefix = "credpay"
  tags = {
    project = "credpay"
    managed_by = "terraform"
  }
}

module "resource_group" {
  source = "./modules/resource_group"
  name = "rg-${local.name_prefix}"
  location = var.location
  tags = local.tags
}
module "networking" {
  source = "./modules/networking"
  name_prefix = local.name_prefix
  resource_group_name = module.resource_group.name
  location = module.resource_group.location
  vnet_address_space = var.vnet_address_space
  aks_subnet_address_space = var.aks_subnet_prefix
  postgres_subnet_address_space = var.postgres_subnet_prefix
  tags = local.tags
}

module "monitoring" {
  source = "./modules/monitoring"
  name_prefix = local.name_prefix
  resource_group_name = module.resource_group.name
  location = module.resource_group.location
  retention_days = var.logretention_days
  tags = local.tags
}

module "postgres" {
  source = "./modules/postgres"
  name_prefix = local.name_prefix
  resource_group_name = module.resource_group.name
  location = module.resource_group.location
  tags = local.tags
  postgres_version = var.postgres_version
  admin_username = var.postgres_admin_username
  database_name = var.database_name
}

module "aks" {
  source = "./modules/aks"
  name_prefix = local.name_prefix
  resource_group_name = module.resource_group.name
  location = module.resource_group.location
  aks_subnet_id = module.networking.subnet_ids["aks"]
  log_analytics_workspace_id = module.monitoring.workspace_id
  node_count = var.node_count
  node_min_count = var.node_min_count
  node_max_count = var.node_max_count
  vm_size = var.vm_size
  tags = local.tags
}

module "keyvault" {
  source = "./modules/keyvault"
  key_vault_name = var.keyvault_name
  key_vault_resource_group_name = var.keyvault_resource_group_name
  postgres_fqdn = module.postgres.fqdn
  postgres_database_name = var.database_name
  postgres_admin_username = var.postgres_admin_username
  postgres_admin_password = module.postgres.admin_password
}