variable "location" {
  description = "Deployment location."
  type        = string
  default     = "uksouth"
}

variable "managed_identity_name" {
  description = "Managed identity name."
  type        = string
}

variable "resource_group_exists" {
  description = "Flag to determine if an existing resource group is to be used."
  type        = bool
  default     = false
}

variable "resource_group_name" {
  description = "Resource group that the managed identity should be created inside."
  type        = string
}

variable "tags" {
  description = "Mandatory tags to be applied on resources."
  type        = map(any)
}
