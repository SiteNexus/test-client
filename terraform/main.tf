# --- main.tf ---
# Defines the Azure resources to be created.

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0" # Using a recent, stable version
    }
  }
  required_version = ">= 1.0"
}

provider "azurerm" {
  features {}
  # Ensure you are logged in via Azure CLI (`az login`) or have Service Principal environment variables set.
}

resource "azurerm_resource_group" "client_rg" {
  name     = var.resource_group_name != "" ? var.resource_group_name : "${lower(var.client_name_prefix)}-rg"
  location = var.location
  tags     = var.tags
}

# Updated resource: azurerm_static_web_app
resource "azurerm_static_web_app" "client_swa" {
  name                = var.static_web_app_name != "" ? var.static_web_app_name : "${lower(var.client_name_prefix)}-sitenexus-swa"
  resource_group_name = azurerm_resource_group.client_rg.name
  location            = azurerm_resource_group.client_rg.location # Static Web Apps are global, but this sets the metadata region.
  tags                = var.tags

  # SKU configuration for azurerm_static_web_app
  sku_tier = var.static_web_app_sku_tier
  sku_size = var.static_web_app_sku_size

  # The content deployment is handled by your Azure Pipeline, so no repository_url or branch here.
}
