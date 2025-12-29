module "frontdoor" {
  source              = "./modules/frontdoor"

  prefix              = var.prefix
  resource_group_name = azurerm_resource_group.main.name
  
  backend_address     = module.storage_account.primary_web_host
  
  enable_frontdoor    = var.environment == "prod" ? true : false
  
  tags                = azurerm_resource_group.main.tags
}