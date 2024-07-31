output "storage_account_id" {
  description = "Id of the storage account."
  value       = azurerm_storage_account.account.id 
}

output "storage_account_name" {
  description = "Name of the storage account."
  value       = azurerm_storage_account.account.name
}
