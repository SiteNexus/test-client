# --- outputs.tf ---
# Defines output values that will be displayed after Terraform applies the configuration.

output "resource_group_name" {
  description = "The name of the created Azure Resource Group."
  value       = azurerm_resource_group.client_rg.name
}

output "static_web_app_id" {
  description = "The ID of the created Azure Static Web App."
  value       = azurerm_static_web_app.client_swa.id
}

output "static_web_app_name" {
  description = "The name of the created Azure Static Web App."
  value       = azurerm_static_web_app.client_swa.name
}

output "static_web_app_default_hostname" {
  description = "The default hostname of the Azure Static Web App."
  value       = azurerm_static_web_app.client_swa.default_host_name
}

# The deployment token is now typically called default_api_key or just api_key
output "static_web_app_api_key" {
  description = "The deployment token (API key) for the Azure Static Web App. Treat this as a secret."
  value       = azurerm_static_web_app.client_swa.api_key # Or default_api_key, check provider docs if an issue
  sensitive   = true
}
