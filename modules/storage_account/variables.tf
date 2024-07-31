variable "access_tier" {
  description = "Access tier for the storage account."
  type        = string
  default     = "Hot"
}

variable "account_kind" {
  description = "Account kind for the storage account."
  type        = string
  default     = "StorageV2"
}

variable "account_replication_type" {
  description = "Account replication type, e.g LRS/ZRS."
  type        = string
  default     = "LRS"
} 

variable "account_tier" {
  description = "Account tier for the storage account."
  type        = string
  default     = "Standard"
}

variable "enable_diagnostics_blob" {
  description = "Flag for enabling transaction diagnostics on the blob storage. Leave as disabled if diagnostics are already deployed via policy."
  type        = bool
  default     = false
}

variable "enable_diagnostics_sa" {
  description = "Flag for enabling transaction diagnostics on the storage account. Leave as disabled if diagnostics are already deployed via policy."
  type        = bool
  default     = false
}

variable "enable_https_traffic_only" {
  description = "Flag for enabling https traffic only. This should always be set to true."
  type        = bool
  default     = true
}

variable "la_workspace_id" {
  description = "Log analytics workspace id. Required if 'enable_diagnostics is set to true."
  type        = string
  default     = null
}

variable "location" {
  description = "Deployment location."
  type        = string
  default     = "uksouth"
}

variable "min_tls_version" {
  description = "The minimum TLS version for the storage account."
  type        = string
  default     = "TLS1_2"
}

variable "resource_group_exists" {
  description = "Flag to determine if an existing resource group is to be used."
  type        = bool
  default     = false
}

variable "resource_group_name" {
  description = "Name of the resource group."
  type        = string
}

variable "storage_account_name" {
  description = "Storage account name."
  type        = string
}

variable "tags" {
  description = "Mandatory tags to be applied on resources."
  type        = map(any)
}
