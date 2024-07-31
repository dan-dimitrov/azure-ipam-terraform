variable "engineappid" {
  description = "IPAM-Engine App Registration Client/App ID"
  type        = string
}

variable "engineappsecret" {
  description = "IPAM-Engine App Registration Client Secret"
  sensitive   = true
  type        = string
}

variable "uiappid" {
  description = "IPAM-UI App Registration Client/App ID"
  type        = string
}
