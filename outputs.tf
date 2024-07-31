output "app_service_host_name" {
  description = "The full app name e.g. 'app.azurewebsites.net'."
  value       = module.app_service.app_service_hostname
}

output "app_service_name" {
  description = "The globally-unique name of the app service."
  value       = module.app_service.app_service_name
}

output "resource_group_name" {
  description = "The resource group name for the deployed resources."
  value       = azurerm_resource_group.ipam.name
}
