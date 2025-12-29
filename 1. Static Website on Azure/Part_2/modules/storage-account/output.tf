output "primary_web_host" {
  description = "The hostname of the static website (without https://)"
  value       = azurerm_storage_account.static.primary_web_host
}