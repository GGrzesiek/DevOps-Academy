terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.0.0"
    }
  }
}

provider "azurerm" {
  features {}
}

module "storage_account" {
  source    = "./modules/storage-account"

  saname    = "sadevopsacad01"
  rgname    = "rg-devopsacad-01"
  location  = "westus"
}
