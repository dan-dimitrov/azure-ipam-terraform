module "app_service" {
  source = "./modules/app_service"

  app_command_line      = !local.deploy_as_container ? "init.sh 8000" : null
  app_service_name      = local.resource_names.app_service
  app_service_plan_name = local.resource_names.app_service_plan
  app_settings          = local.app_settings
  auth_settings_enabled = false
  client_cert_enabled   = false
  enable_diagnostics    = false # Diagnostics enabled in environment via policy
  health_check_path     = local.health_check_path
  http2_enabled         = false
  https_only            = false
  la_workspace_id       = local.existing_la_workspace == null ? module.log_analytics_workspace.workspace_id : local.existing_la_workspace
  linux_fx_version      = local.deploy_as_container ? "DOCKER|${local.acr_uri}/ipam:latest" : "PYTHON|3.9"
  location              = local.location
  managed_identity_id   = module.managed_identity.id
  managed_identity_type = "UserAssigned"
  resource_group_name   = azurerm_resource_group.ipam.name
  tags                  = local.tags

  depends_on = [module.cosmos_db, module.container_registry, module.storage_account]
}

module "container_registry" {
  count  = local.private_acr ? 1 : 0
  source = "./modules/container_registry"

  container_registry_name = local.resource_names.container_registry
  location                = local.location
  principal_id            = module.managed_identity.principal_id
  resource_group_name     = azurerm_resource_group.ipam.name
  tags                    = local.tags
}

module "cosmos_db" {
  source = "./modules/cosmos_db"

  cosmos_account_name   = local.resource_names.cosmos_account
  cosmos_container_name = local.resource_names.cosmos_container
  cosmos_database_name  = local.resource_names.cosmos_database
  la_workspace_id       = local.existing_la_workspace == null ? module.log_analytics_workspace.workspace_id : local.existing_la_workspace
  location              = local.location
  principal_id          = module.managed_identity.principal_id
  resource_group_name   = azurerm_resource_group.ipam.name
  tags                  = local.tags

  depends_on = [azurerm_resource_group.ipam]
}

module "function_app" {
  count  = local.deploy_as_func ? 1 : 0
  source = "./modules/function_app"

  container_name       = local.resource_names.cosmos_container
  cosmos_db_uri        = module.cosmos_db.cosmos_document_endpoint
  database_name        = local.resource_names.cosmos_database
  deploy_as_container  = local.deploy_as_container
  function_app_name    = local.resource_names.function
  function_plan_name   = local.resource_names.function_plan
  key_vault_uri        = module.key_vault.key_vault_uri
  location             = local.location
  managed_identity_id  = module.managed_identity.id
  private_acr          = local.private_acr
  private_acr_uri      = local.private_acr ? module.container_registry.private_acr_uri : ""
  resource_group_name  = azurerm_resource_group.ipam.name
  storage_account_name = local.resource_names.storage_account
  tags                 = local.tags
}

module "key_vault" {
  source = "./modules/key_vault"

  key_vault_name      = local.resource_names.key_vault
  key_vault_secrets   = local.key_vault_secrets
  location            = local.location
  resource_group_name = azurerm_resource_group.ipam.name
  tags                = local.tags

  depends_on = [azurerm_resource_group.ipam, module.cosmos_db]
}

module "log_analytics_workspace" {
  count  = local.existing_la_workspace == null ? 1 : 0
  source = "./modules/log_analytics_workspace"

  location            = local.location
  resource_group_name = azurerm_resource_group.ipam.name
  tags                = local.tags
  workspace_name      = local.resource_names.workspace

  depends_on = [azurerm_resource_group.ipam]
}

module "managed_identity" {
  source = "./modules/managed_identity"

  location              = local.location
  managed_identity_name = local.resource_names.managed_identity
  resource_group_exists = true
  resource_group_name   = azurerm_resource_group.ipam.name
  tags                  = local.tags

  depends_on = [azurerm_resource_group.ipam]
}

module "storage_account" {
  count  = local.deploy_as_func ? 1 : 0
  source = "./modules/storage_account"

  la_workspace_id      = local.existing_la_workspace == null ? module.log_analytics_workspace.workspace_id : local.existing_la_workspace
  location             = local.location
  resource_group_name  = azurerm_resource_group.ipam.name
  storage_account_name = local.resource_names.storage_account
  tags                 = local.tags
}
