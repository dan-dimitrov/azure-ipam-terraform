locals {
  acr_uri = var.private_acr ? var.private_acr_uri : "azureipam.azurecr.io"
}
