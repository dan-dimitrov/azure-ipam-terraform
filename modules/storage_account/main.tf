resource "azurerm_resource_group" "storage" {
  count = var.resource_group_exists ? 0 : 1

  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

resource "azurerm_storage_account" "account" {
  name                      = var.storage_account_name
  resource_group_name       = var.resource_group_name
  location                  = var.location
  account_tier              = var.account_tier
  account_replication_type  = var.account_replication_type
  account_kind              = var.account_kind
  access_tier               = var.access_tier
  enable_https_traffic_only = var.enable_https_traffic_only
  min_tls_version           = var.min_tls_version
  tags                      = var.tags
}

resource "azurerm_monitor_diagnostic_setting" "storage_account" {
  count = var.enable_diagnostics_sa ? 1 : 0

  name                       = "diagSettingsaccount"
  target_resource_id         = azurerm_storage_account.account.id
  log_analytics_workspace_id = var.la_workspace_id

  metric {
    category = "Transaction"
    enabled  = true
  }
}

resource "azurerm_monitor_diagnostic_setting" "blob_service" {
  count = var.enable_diagnostics_blob ? 1 : 0

  name                       = "diagSettingsblob"
  target_resource_id         = "${azurerm_storage_account.account.id}/blobservices/default"
  log_analytics_workspace_id = var.la_workspace_id

  metric {
    category = "Transaction"
    enabled  = true
  }
}
