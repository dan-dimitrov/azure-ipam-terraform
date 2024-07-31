output "key_vault_id" {
  description = "Identity of the key vault."
  value       = azurerm_key_vault.vault.id
}

output "key_vault_name" {
  description = "Name of the key vault."
  value       = azurerm_key_vault.vault.name
}

output "key_vault_uri" {
  description = "Uri of the key vault."
  value       = azurerm_key_vault.vault.vault_uri
}
