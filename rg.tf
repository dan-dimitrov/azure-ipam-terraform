resource "azurerm_resource_group" "ipam" {
  name     = local.resource_names.resource_group
  location = local.location
  tags     = local.tags
}
