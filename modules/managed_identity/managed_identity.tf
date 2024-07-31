resource "azurerm_resource_group" "identity" {
  count = var.resource_group_exists ? 0 : 1

  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

resource "azurerm_user_assigned_identity" "identity" {
  name                = var.managed_identity_name
  location            = var.location
  resource_group_name = var.resource_group_exists ? var.resource_group_name : azurerm_resource_group.identity[0].name
  tags                = var.tags
}
