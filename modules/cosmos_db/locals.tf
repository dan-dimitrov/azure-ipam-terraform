locals {
  db_contributor    = "00000000-0000-0000-0000-000000000002"
  db_contributor_id = "${data.azurerm_resource_group.ipam.id}/providers/Microsoft.DocumentDB/databaseAccounts/${var.cosmos_account_name}/sqlRoleDefinitions/${local.db_contributor}"
}
