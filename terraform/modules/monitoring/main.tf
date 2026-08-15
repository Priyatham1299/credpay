resource "azurerm_log_analytics_workspace" "name" {
  name = "log-${var.name_prefix}"
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = "PerGB2018"
  retention_in_days   = var.retention_days
  tags                = var.tags
}

resource "azurerm_log_analytics_solution" "solution" {
    solution_name         = "ContainerInsights"
    location              = var.location
    resource_group_name   = var.resource_group_name
    workspace_resource_id = azurerm_log_analytics_workspace.name.id
    workspace_name        = azurerm_log_analytics_workspace.name.name
    tags                 = var.tags
    plan {
        publisher = "Microsoft"
        product   = "OMSGallery/ContainerInsights"
    }
}