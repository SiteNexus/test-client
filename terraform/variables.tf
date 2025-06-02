# --- variables.tf ---
# Defines input variables for your Terraform configuration.

variable "client_name_prefix" {
  type        = string
  description = "A unique prefix for the client's resources (e.g., 'clientalpha', 'acmeinc'). Should be lowercase, no spaces or special characters other than hyphens."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the Azure Resource Group. If not provided, one will be generated using client_name_prefix."
  default     = ""
}

variable "static_web_app_name" {
  type        = string
  description = "The name of the Azure Static Web App. If not provided, one will be generated using client_name_prefix."
  default     = ""
}

variable "location" {
  type        = string
  description = "The Azure region where resources will be deployed (e.g., 'East US 2', 'West Europe')."
  default     = "East US 2"
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to assign to the created resources."
  default = {
    environment = "Production"
    project     = "SiteNexusClient"
  }
}

# Variables for the SKU of the Static Web App
variable "static_web_app_sku_tier" {
  type        = string
  description = "The SKU tier for the Azure Static Web App. 'Free' or 'Standard'."
  default     = "Free"
}

variable "static_web_app_sku_size" {
  type        = string
  description = "The SKU size for the Azure Static Web App. Corresponds to the tier (e.g., 'Free' or 'Standard')."
  default     = "Free"
}