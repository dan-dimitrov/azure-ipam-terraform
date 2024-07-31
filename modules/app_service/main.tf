resource "azurerm_app_service_plan" "app_service_plan" {
  count = var.existing_app_service_plan ? 0 : 1

  name                = var.app_service_plan_name
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
  kind                = "Linux"
  reserved            = true

  sku {
    capacity = var.service_plan_capacity
    tier     = var.service_plan_tier
    size     = var.service_plan_size
  }
}

resource "azurerm_app_service" "app_service" {
  name                            = var.app_service_name
  location                        = var.location
  key_vault_reference_identity_id = var.managed_identity_id
  resource_group_name             = var.resource_group_name
  tags                            = var.tags
  app_service_plan_id             = var.existing_app_service_plan ? var.app_service_plan_id : azurerm_app_service_plan.app_service_plan[0].id
  https_only                      = var.https_only
  client_cert_enabled             = var.client_cert_enabled #tfsec:ignore:azure-appservice-require-client-cert

  auth_settings {
    enabled = var.auth_settings_enabled #tfsec:ignore:azure-appservice-authentication-enabled
  }

  site_config {
    acr_use_managed_identity_credentials = var.acr_use_managed_identity_credentials
    acr_user_managed_identity_client_id  = var.acr_user_managed_identity_client_id
    always_on                            = var.always_on
    app_command_line                     = var.app_command_line
    linux_fx_version                     = var.linux_fx_version
    health_check_path                    = var.health_check_path
    http2_enabled                        = var.http2_enabled #tfsec:ignore:azure-appservice-enable-http2
  }

  identity {
    type         = var.managed_identity_type
    identity_ids = var.managed_identity_type == "UserAssigned" ? [var.managed_identity_id] : []
  }

  app_settings = var.app_settings

  logs {
    detailed_error_messages_enabled = true
    failed_request_tracing_enabled  = true
    http_logs {
      file_system {
        retention_in_days = 7
        retention_in_mb   = 50
      }
    }
  }
}

resource "azurerm_monitor_diagnostic_setting" "service_plan" {
  count              = var.enable_diagnostics ? 1 : 0
  name               = "diagSettings"
  target_resource_id = azurerm_app_service_plan.app_service_plan[0].id
  metric {
    category = "AllMetrics"
    enabled  = true
    retention_policy {
      days    = "0"
      enabled = false
    }
  }
  log_analytics_workspace_id = var.la_workspace_id
}

resource "azurerm_monitor_diagnostic_setting" "web_app" {
  count              = var.enable_diagnostics ? 1 : 0
  name               = "diagSettings"
  target_resource_id = azurerm_app_service.app_service.id
  enabled_log {
    category = "AppServiceAntivirusScanAuditLogs"
    retention_policy {
      days    = "0"
      enabled = false
    }
  }
  enabled_log {
    category = "AppServiceHTTPLogs"
    retention_policy {
      days    = "0"
      enabled = false
    }
  }
  enabled_log {
    category = "AppServiceConsoleLogs"
    retention_policy {
      days    = "0"
      enabled = false
    }
  }
  enabled_log {
    category = "AppServiceAppLogs"
    retention_policy {
      days    = "0"
      enabled = false
    }
  }
  enabled_log {
    category = "AppServiceFileAuditLogs"
    retention_policy {
      days    = "0"
      enabled = false
    }
  }
  enabled_log {
    category = "AppServiceAuditLogs"
    retention_policy {
      days    = "0"
      enabled = false
    }
  }
  enabled_log {
    category = "AppServiceIPSecAuditLogs"
    retention_policy {
      days    = "0"
      enabled = false
    }
  }
  enabled_log {
    category = "AppServicePlatformLogs"
    retention_policy {
      days    = "0"
      enabled = false
    }
  }
  metric {
    category = "AllMetrics"
    enabled  = true
    retention_policy {
      days    = "0"
      enabled = false
    }
  }
  log_analytics_workspace_id = var.la_workspace_id
}
