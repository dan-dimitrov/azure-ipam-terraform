output "app_service_hostname" {
  description = "App service hostname."
  value       = azurerm_app_service.app_service.default_site_hostname
}

output "app_service_name" {
  description = "App service name."
  value       = azurerm_app_service.app_service.name
}

output "app_service_plan_id" {
  description = "Identity of the App service plan."
  value       = var.existing_app_service_plan ? var.app_service_plan_id : azurerm_app_service_plan.app_service_plan[0].id
}
