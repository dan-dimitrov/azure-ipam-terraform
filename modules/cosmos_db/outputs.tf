output "cosmos_container_name" {
  description = "Cosmos container name."
  value       = azurerm_cosmosdb_sql_container.cosmos_container.name
}

output "cosmos_database_name" {
  description = "Cosmos database name."
  value       = azurerm_cosmosdb_sql_container.cosmos_container.database_name
}

output "cosmos_document_endpoint" {
  description = "Cosmos database uri."
  value       = azurerm_cosmosdb_account.cosmos_account.endpoint
}

output "cosmos_primary_key" {
  description = "Cosmos primary key value."
  value       = azurerm_cosmosdb_account.cosmos_account.primary_key
}
