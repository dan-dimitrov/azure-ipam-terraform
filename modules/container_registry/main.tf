resource "azurerm_container_registry" "example" {
  name                = var.container_registry_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Standard"
  admin_enabled       = false
  tags                = var.tags
}

resource "azurerm_role_assignment" "example" {
  name               = "7f951dda-4ed3-4680-a7ca-43fe172d538d"
  scope              = azurerm_container_registry.example.id
  role_definition_id = local.acr_pull_role_id
  principal_id       = var.principal_id
}
