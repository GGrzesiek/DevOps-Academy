variable "prefix" {}
variable "resource_group_name" {}
variable "backend_address" {
  description = "The hostname of the storage account (e.g. mystorage.z6.web...)"
}
variable "tags" { type = map(string) }
variable "enable_frontdoor" {
  type    = bool
  default = true
}