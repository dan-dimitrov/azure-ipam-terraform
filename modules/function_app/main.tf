resource "azurerm_app_service_plan" "function_plan" {
  name                = var.function_plan_name
  location            = var.location
  resource_group_name = var.resource_group_name
  kind                = "elastic"
  reserved            = true
  tags                = var.tags

  sku {
    tier = "ElasticPremium"
    size = "EP1"
  }
}

resource "azurerm_storage_account" "storage_account" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  min_tls_version          = var.min_tls_version
}

resource "azurerm_function_app" "function_app" {
  name                       = var.function_app_name
  location                   = var.location
  resource_group_name        = var.resource_group_name
  app_service_plan_id        = azurerm_app_service_plan.function_plan.id
  storage_account_name       = var.storage_account_name
  storage_account_access_key = azurerm_storage_account.storage_account.primary_access_key
  version                    = "~4"
  https_only                 = true
  tags                       = var.tags
}
