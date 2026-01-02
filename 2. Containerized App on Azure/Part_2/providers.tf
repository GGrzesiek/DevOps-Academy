terraform {
  required_version = "= 1.14.3"
  
  backend "azurerm" {} 

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "= 4.0.0"
    }
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.6.2"
    }
  }
}

provider "azurerm" {
  features {}
}