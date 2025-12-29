# 1. Profile
resource "azurerm_cdn_frontdoor_profile" "main" {
  count               = var.enable_frontdoor ? 1 : 0
  name                = "${var.prefix}-fd-profile"
  resource_group_name = var.resource_group_name
  sku_name            = "Standard_AzureFrontDoor"
  tags                = var.tags
}

# 2. Endpoint
resource "azurerm_cdn_frontdoor_endpoint" "main" {
  count                    = var.enable_frontdoor ? 1 : 0
  name                     = "${var.prefix}-fd-endpoint"
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.main[0].id
  tags                     = var.tags
}

# 3. Origin Group
resource "azurerm_cdn_frontdoor_origin_group" "main" {
  count                    = var.enable_frontdoor ? 1 : 0
  name                     = "default-origin-group"
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.main[0].id

  load_balancing {
    additional_latency_in_milliseconds = 0
    sample_size                        = 4
    successful_samples_required        = 3
  }

  health_probe {
    path                = "/"
    protocol            = "Http"
    interval_in_seconds = 100
    request_type        = "HEAD"
  }
}

# 4. Origin
resource "azurerm_cdn_frontdoor_origin" "main" {
  count                         = var.enable_frontdoor ? 1 : 0
  name                          = "storage-origin"
  cdn_frontdoor_origin_group_id = azurerm_cdn_frontdoor_origin_group.main[0].id

  enabled                        = true
  certificate_name_check_enabled = true
  host_name                      = var.backend_address
  http_port                      = 80
  https_port                     = 443
  origin_host_header             = var.backend_address
  priority                       = 1
  weight                         = 1000
}

# 5. Route
resource "azurerm_cdn_frontdoor_route" "main" {
  count                         = var.enable_frontdoor ? 1 : 0
  name                          = "default-route"
  cdn_frontdoor_endpoint_id     = azurerm_cdn_frontdoor_endpoint.main[0].id
  cdn_frontdoor_origin_group_id = azurerm_cdn_frontdoor_origin_group.main[0].id
  cdn_frontdoor_origin_ids      = [azurerm_cdn_frontdoor_origin.main[0].id]

  supported_protocols    = ["Http", "Https"]
  patterns_to_match      = ["/*"]
  forwarding_protocol    = "HttpsOnly"
  link_to_default_domain = true
  https_redirect_enabled = true
}