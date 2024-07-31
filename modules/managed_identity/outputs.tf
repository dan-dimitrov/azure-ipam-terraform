output "client_id" {
  description = "Client id of the managed identity."
  value       = azurerm_user_assigned_identity.identity.client_id
}

output "id" {
  description = "ID of the managed identity."
  value       = azurerm_user_assigned_identity.identity.id
}

output "principal_id" {
  description = "Principal id of the managed identity."
  value       = azurerm_user_assigned_identity.identity.principal_id
}
