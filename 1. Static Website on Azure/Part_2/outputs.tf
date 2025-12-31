output "frontdoor_url" {
  description = "The global endpoint for the website"
  value       = module.frontdoor.fd_endpoint
}

output "storage_origin_host" {
  description = "The direct link to the storage account (for debugging)"
  value       = module.storage_account.primary_web_host
}