resource "azurerm_cosmosdb_account" "cosmos_account" {
  name                      = var.cosmos_account_name
  location                  = var.location
  resource_group_name       = var.resource_group_name
  enable_automatic_failover = true
  offer_type                = "Standard"
  kind                      = "GlobalDocumentDB"
  tags                      = var.tags

  consistency_policy {
    consistency_level       = "Session"
    max_interval_in_seconds = 10
    max_staleness_prefix    = 200
  }

  geo_location {
    location          = var.location
    failover_priority = 0
  }
}

resource "azurerm_cosmosdb_sql_database" "cosmos_database" {
  name                = var.cosmos_database_name
  resource_group_name = var.resource_group_name
  account_name        = azurerm_cosmosdb_account.cosmos_account.name
  depends_on          = [azurerm_cosmosdb_account.cosmos_account]
}

resource "azurerm_cosmosdb_sql_container" "cosmos_container" {
  name                = var.cosmos_container_name
  resource_group_name = var.resource_group_name
  account_name        = azurerm_cosmosdb_account.cosmos_account.name
  database_name       = azurerm_cosmosdb_sql_database.cosmos_database.name

  partition_key_path = "/tenant_id"

  autoscale_settings {
    max_throughput = 1000
  }

  indexing_policy {
    indexing_mode = "consistent"
    included_path {
      path = "/*"
    }
    excluded_path {
      path = "/_etag/?"
    }
  }
}

resource "azurerm_monitor_diagnostic_setting" "diagnostic_setting" {
  name                           = "diagSettings"
  target_resource_id             = azurerm_cosmosdb_account.cosmos_account.id
  log_analytics_workspace_id     = var.la_workspace_id
  log_analytics_destination_type = "Dedicated"

  metric {
    category = "AllMetrics"
    enabled  = true
  }
}

resource "random_uuid" "role_assignment_name" {}

resource "azurerm_cosmosdb_sql_role_assignment" "sql_role_assignment" {
  name                = random_uuid.role_assignment_name.result
  scope               = azurerm_cosmosdb_account.cosmos_account.id
  resource_group_name = var.resource_group_name
  account_name        = azurerm_cosmosdb_account.cosmos_account.name
  role_definition_id  = local.db_contributor_id
  principal_id        = var.principal_id
}
