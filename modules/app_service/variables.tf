variable "acr_use_managed_identity_credentials" {
  description = "Use managed identity credentials for ACR"
  type        = bool
  default     = false
}

variable "acr_user_managed_identity_client_id" {
  description = "Identity for Managed identity client"
  type        = string
  default     = ""
}

variable "always_on" {
  description = "Always on"
  type        = bool
  default     = true
}

variable "app_command_line" {
  description = "Application command line entry"
  type        = string
  default     = ""
}

variable "app_service_name" {
  description = "App service name."
  type        = string
}

variable "app_service_plan_name" {
  description = "App service plan name."
  type        = string
  default     = ""
}

variable "app_settings" {
  description = "List of app settings to apply to the web app."
  type        = map(any)
  default     = {}
}

variable "app_service_plan_id" {
  description = "Identity of the App service plan."
  type        = string
  default     = ""
}

variable "auth_settings_enabled" {
  description = "Flag to determine if applicaiton authentication settings are enabled."
  type        = bool
  default     = false
}

variable "client_cert_enabled" {
  description = "Flag to determine if client certs are enabled."
  type        = bool
  default     = false
}

variable "enable_diagnostics" {
  description = "Flag to deploy log analytics diagnostics. Leave as disabled if applied elsewhere through policy."
  type        = bool
  default     = false
}

variable "existing_app_service_plan" {
  description = "Flag to utilise exisiting app service plan. If true provide app service plan ID (app_service_plan_id)."
  type        = bool
  default     = false
}

variable "health_check_path" {
  description = "Health check path"
  type        = string
  default     = ""
}

variable "http2_enabled" {
  description = "Flag to determine if the app HTTP version should be 2.0, or remain as 1.1."
  type        = bool
  default     = false
}

variable "https_only" {
  description = "Flag to determine whether the app forces https traffic only."
  type        = bool
  default     = true
}

variable "la_workspace_id" {
  description = "Log analytics workspace id."
  type        = string
  default     = ""
}

variable "linux_fx_version" {
  description = "Linux FX version"
  type        = string
  default     = ""
}

variable "location" {
  description = "Deployment location."
  type        = string
  default     = "uksouth"
}

variable "managed_identity_id" {
  description = "Managed identity id."
  type        = string
  default     = null
}

variable "managed_identity_type" {
  description = "Defines the identity assignment type"
  type        = string
  default     = "SystemAssigned"
}

variable "resource_group_name" {
  description = "Resource group name."
  type        = string
}

variable "service_plan_capacity" {
  description = "The number of service plans instances to deploy."
  type        = number
  default     = 1
}

variable "service_plan_size" {
  description = "The sku size for the service plan."
  type        = string
  default     = "P1v3"
}

variable "service_plan_tier" {
  description = "The SKU tier for the service plan."
  type        = string
  default     = "PremiumV3"
}

variable "tags" {
  description = "Mandatory tags to be applied on resources."
  type        = map(any)
}
