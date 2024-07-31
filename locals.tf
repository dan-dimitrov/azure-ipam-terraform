locals {
  acr_uri               = local.private_acr ? local.private_acr_uri : "azureipam.azurecr.io"
  deploy_as_container   = true
  deploy_as_func        = false
  existing_la_workspace = "[EXISTING_LA_WORKSPACE]" # Set as null to provision a new workspace
  health_check_path     = "/api/status"
  location              = "uksouth"
  private_acr           = false
  private_acr_uri       = local.private_acr ? module.container_registry.acr_uri : ""

  app_settings = {
    "AZURE_ENV"                           = "AZURE_PUBLIC"
    "COSMOS_URL"                          = module.cosmos_db.cosmos_document_endpoint
    "DATABASE_NAME"                       = module.cosmos_db.cosmos_database_name
    "CONTAINER_NAME"                      = module.cosmos_db.cosmos_container_name
    "MANAGED_IDENTITY_ID"                 = "@Microsoft.KeyVault(SecretUri=${module.key_vault.key_vault_uri}secrets/IDENTITY-ID/)"
    "UI_APP_ID"                           = "@Microsoft.KeyVault(SecretUri=${module.key_vault.key_vault_uri}secrets/UI-ID/)"
    "ENGINE_APP_ID"                       = "@Microsoft.KeyVault(SecretUri=${module.key_vault.key_vault_uri}secrets/ENGINE-ID/)"
    "ENGINE_APP_SECRET"                   = "@Microsoft.KeyVault(SecretUri=${module.key_vault.key_vault_uri}secrets/ENGINE-SECRET/)"
    "TENANT_ID"                           = "@Microsoft.KeyVault(SecretUri=${module.key_vault.key_vault_uri}secrets/TENANT-ID/)"
    "KEYVAULT_URL"                        = module.key_vault.key_vault_uri
    "WEBSITE_HEALTHCHECK_MAXPINGFAILURES" = "2"
    "WEBSITE_ENABLE_SYNC_UPDATE_SITE"     = local.deploy_as_container ? "true" : null
    "DOCKER_REGISTRY_SERVER_URL"          = local.deploy_as_container ? local.private_acr ? "https://${local.private_acr_uri}" : "https://index.docker.io/v1" : null
    "SCM_DO_BUILD_DURING_DEPLOYMENT"      = !local.deploy_as_container ? "true" : null
  }

  key_vault_secrets = {
    IDENTITY-ID = {
      value           = module.managed_identity.client_id
      content_type    = "text/plain"
      expiration_date = "2024-12-31T00:00:00Z"
    }
    UI-ID = {
      value           = var.uiappid
      content_type    = "text/plain"
      expiration_date = "2024-12-31T00:00:00Z"
    }
    ENGINE-ID = {
      value           = var.engineappid
      content_type    = "text/plain"
      expiration_date = "2024-12-31T00:00:00Z"
    }
    ENGINE-SECRET = {
      value           = var.engineappsecret
      content_type    = "text/plain"
      expiration_date = "2024-12-31T00:00:00Z"
    }
    TENANT-ID = {
      value           = data.azurerm_client_config.current.tenant_id
      content_type    = "text/plain"
      expiration_date = "2024-12-31T00:00:00Z"
    }
    COSMOS-KEY = {
      value           = module.cosmos_db.cosmos_primary_key
      content_type    = "password"
      expiration_date = "2025-12-31T12:00:00Z"
    }
  }

  resource_names = {
    app_service        = "[APP_SERVICE]"
    app_service_plan   = "[APP_SERVICE_PLAN]"
    container_registry = "[CONTAINER_REGISTRY]"
    cosmos_account     = "[COSMOS_ACCOUNT]"
    cosmos_container   = "[COSMOS_CONTAINER]"
    cosmos_database    = "[COSMOS_DATABASE]"
    function           = "[FUNCTION_APP]"
    function_plan      = "[FUNCTION_PLAN]"
    key_vault          = "[KEY_VAULT]"
    managed_identity   = "[MANAGED_IDENTITY]"
    resource_group     = "[RESOURCE_GROUP]"
    storage_account    = "[STORAGE_ACCOUNT]"
    workspace          = "[LA_WORKSPACE]"
  }

  tags = {
    "[TAG 1]" = "[TAG1]"
    "[TAG 2]" = "[TAG2]"
    "[TAG 3]" = "[TAG3]"
  }
}
