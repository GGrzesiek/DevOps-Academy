resource "azurerm_storage_account" "static" {
  name                     = "${var.prefix}st1"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  
  static_website {
    index_document     = "index.html"
    error_404_document = "404.html"
  }

  tags = var.tags
}

resource "azurerm_storage_blob" "assets" {
  for_each = {
    "index.html" = "<h1>Hello World from Terraform</h1>"
    "404.html"   = "<h1>Error 404: Not Found</h1>"
  }

  name                   = each.key
  storage_account_name   = azurerm_storage_account.static.name
  storage_container_name = "$web"
  type                   = "Block"
  content_type           = "text/html"
  source_content         = each.value
}