variable "key_vault_name" {
  description = "Key vault name."
  type        = string
}

variable "key_vault_secrets" {
  description = "List of zero or more key vault secrets to create with the key vault."
  type = map(object({
    value           = string
    content_type    = string
    expiration_date = string
  }))
  default = {}
}

variable "location" {
  description = "Deployment location."
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
