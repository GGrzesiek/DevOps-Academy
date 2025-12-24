terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.0.0"
    }
  }
}

# resource "azurerm_storage_account" "sa" {
#   name                     = var.saname
#   resource_group_name      = var.rgname
#   location                 = var.location
#   account_tier             = "Standard"
#   account_replication_type = "GRS"

# }