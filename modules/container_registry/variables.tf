variable "location" {
  description = "Deployment Location"
  type        = string
}

variable "container_registry_name" {
  description = "Container Registry Name"
  type        = string
}

variable "principal_id" {
  description = "Managed Identity PrincipalId"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group."
  type        = string
}

variable "tags" {
  description = "Mandatory tags to be applied on resources."
  type        = map(any)
}
