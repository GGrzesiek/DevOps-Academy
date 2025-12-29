output "fd_endpoint" {
  description = "The URL of the Front Door"
  value = try("https://${azurerm_cdn_frontdoor_endpoint.main[0].host_name}", "Front Door Disabled")
}