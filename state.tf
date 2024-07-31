terraform {
  backend "azurerm" {
    storage_account_name = "[STORAGE_ACCOUNT]"
    container_name       = "[CONTAINER_NAME]"
    resource_group_name  = "[RESOURCE_GROUP]"
    key                  = "[STATE_FILE_NAME].tfstate"
    subscription_id      = "[SUBSCRIPTION_ID]"
  }
}
