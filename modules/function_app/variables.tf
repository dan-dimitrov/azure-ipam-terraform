variable "function_app_name" {
  description = "Function App Name"
  type        = string
}

variable "function_plan_name" {
  description = "Function Plan Name"
  type        = string
}

variable "cosmos_db_uri" {
  description = "CosmosDB URI"
  type        = string
}

variable "database_name" {
  description = "CosmosDB Database Name"
  type        = string
}

variable "container_name" {
  description = "CosmosDB Container Name"
  type        = string
}

variable "key_vault_uri" {
  description = "KeyVault URI"
  type        = string
}

variable "location" {
  description = "Deployment Location"
  type        = string
  default     = "westus"
}

variable "azure_cloud" {
  description = "Azure Cloud Enviroment"
  type        = string
  default     = "AZURE_PUBLIC"
}

variable "managed_identity_id" {
  description = "Managed Identity Id"
  type        = string
}

variable "deploy_as_container" {
  description = "Flag to Deploy IPAM as a Container"
  type        = bool
  default     = false
}

variable "private_acr" {
  description = "Flag to Deploy Private Container Registry"
  type        = bool
  default     = false
}

variable "private_acr_uri" {
  description = "Uri for Private Container Registry"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
}

variable "storage_account_name" {
  description = "Storage Account Name"
  type        = string
}

variable "tags" {
  description = "Mandatory tags to be applied on resources."
  type        = map(any)
}

variable "min_tls_version" {
  description = "The minimum TLS version for the storage account."
  type        = string
  default     = "TLS1_2"
}
