locals {
  env_locations = {
    dev  = "West Europe"
    prod = "North Europe"
  }

  final_location = var.location != "" ? var.location : lookup(local.env_locations, var.environment, "West Europe")
}

resource "azurerm_resource_group" "main" {
  name     = "${var.prefix}-rg"
  location = local.final_location

  tags = merge(var.tags, {
    project = coalesce(try(var.tags["project"], null), "static-web")
    managed_by = "terraform"
  })
}