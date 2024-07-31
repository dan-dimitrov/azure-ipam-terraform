resource "azurerm_key_vault_access_policy" "policy" {
  key_vault_id = module.key_vault.key_vault_id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = module.managed_identity.principal_id

  key_permissions = [
    "Get"
  ]

  secret_permissions = [
    "Get"
  ]
}
