variable "location" {
  description = "Deployment location."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group."
  type        = string
}

variable "retention" {
  description = "Retention in days for the workspace."
  default     = 30
  type        = number
}

variable "sku" {
  description = "Sku for the workspace."
  default     = "PerGB2018"
  type        = string
}

variable "tags" {
  description = "Mandatory tags to be applied on resources."
  type        = map(any)
}

variable "workspace_name" {
  description = "Log analytics workspace name."
  type        = string
}
