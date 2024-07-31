output "acr_name" {
  value = azurerm_container_registry.example.name
}

output "acr_uri" {
  value = azurerm_container_registry.example.login_server
}
