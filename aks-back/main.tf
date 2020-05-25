provider "azurerm" {
  # The "feature" block is required for AzureRM provider 2.x. 
  # If you are using version 1.x, the "features" block is not allowed.
  version = "~>2.0"

  client_id = var.client_id
  client_secret = var.client_secret
  subscription_id = var.subscription_id
  tenant_id = "d1378a09-43cd-4f68-81b9-69e69a6d7197"

  features {
  }
}

//terraform {
//  backend "azurerm" {}
//}
