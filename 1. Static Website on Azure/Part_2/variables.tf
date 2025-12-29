variable "prefix" {
  description = "Prefix for resource names"
  type        = string
}

variable "environment" {
  description = "Environment (dev, prod) used for logic lookups"
  type        = string
  default     = "dev"
}

variable "location" {
  description = "Azure region (optional override)"
  type        = string
  default     = ""
}

variable "tags" {
  description = "Map of tags"
  type        = map(string)
  default     = {}
}