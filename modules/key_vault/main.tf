resource "azurerm_key_vault" "vault" {
  name                       = var.key_vault_name
  location                   = var.location
  resource_group_name        = var.resource_group_name
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  sku_name                   = "standard"
  purge_protection_enabled   = true
  soft_delete_retention_days = 7
  tags                       = var.tags

  network_acls {
    default_action = "Deny"
    bypass         = "AzureServices"
    ip_rules       = ["0.0.0.0/2"]
  }
}

resource "azurerm_key_vault_access_policy" "ado_spn" {
  key_vault_id = azurerm_key_vault.vault.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = data.azurerm_client_config.current.object_id

  key_permissions = [
    "Create",
    "Delete",
    "Get",
    "Recover",
    "Update"
  ]
  secret_permissions = [
    "Delete",
    "Get",
    "List",
    "Recover",
    "Set"
  ]
}

resource "azurerm_key_vault_secret" "secret" {
  for_each        = var.key_vault_secrets
  name            = each.key
  value           = each.value.value
  key_vault_id    = azurerm_key_vault.vault.id
  content_type    = each.value.content_type
  expiration_date = each.value.expiration_date
  depends_on      = [azurerm_key_vault_access_policy.ado_spn]
}
