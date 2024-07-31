output "workspace_id" {
  description = "Identity of the log analytics workspace."
  value       = azurerm_log_analytics_workspace.workspace.workspace_id
}

output "workspace_name" {
  description = "Name of the log analytics workspace."
  value       = azurerm_log_analytics_workspace.workspace.name
}
