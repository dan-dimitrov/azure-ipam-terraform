resource "azurerm_log_analytics_workspace" "workspace" {
  name                = var.workspace_name
  location            = var.location
  resource_group_name = var.resource_group_name
  retention_in_days   = var.retention
  sku                 = var.sku
  tags                = var.tags
}
