variable "cosmos_account_name" {
  description = "Cosmos account name."
  type        = string
}

variable "cosmos_container_name" {
  description = "Cosmos container name."
  type        = string
}

variable "cosmos_database_name" {
  description = "Cosmos database name."
  type        = string
}

variable "la_workspace_id" {
  description = "Log analytics workspace id."
  type        = string
}

variable "location" {
  description = "Deployment location."
  type        = string
}

variable "principal_id" {
  description = "Managed identity principal id."
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name."
  type        = string
}

variable "tags" {
  description = "Mandatory tags to be applied on resources."
  type        = map(any)
}
